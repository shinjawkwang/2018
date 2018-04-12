#include "sfp.h"
#include <stdlib.h>
#include <math.h>
#define SIG(sfp)    (((sfp)&0x8000) > 0)    // sign bit를 가져옴
#define EXP(sfp)    (((sfp)&0x7E00) >> 9)   // EXP를 구함
#define E(sfp)      (EXP(sfp) - 31)         // E를 구함
#define FRAC(sfp)   (((sfp)&0x1FF) + 0x200) // M을 구함

sfp int2sfp(int input){
    sfp s = 0, frac = 0, expo;
    int sv = input, cnt = 0, e = 0;
    /* when input is 0 */
    if (!input) {
        return 0;
    }
    if (input < 0){
        s = 1 << 15;
    }
    while (sv > 1) {
        sv = sv >> 1;
        cnt ++;
    }
    frac += (input << (9 - cnt)) - (1 << 9);
    expo = (cnt + 31) << 9;
    return expo + s + frac;
}

int sfp2int(sfp input){
    int test;
    int result;
    int s = 1 - 2 * SIG(input);
    int exp = EXP(input);
    int e = E(input);
    int m = FRAC(input);

    if (exp == 127) {
        if (m == 0x200) {
            if (s==-1) {
                return -2147483648;
            }
            else {
                return 2147483647;
            }
        }
        else {
            return -2147483648;
        }
    }

    result = s * m * pow(2, e - 9);
    return result;
}

sfp float2sfp(float input){
    unsigned fTemp;
    fTemp = *(unsigned *)&input;
    sfp s, frac = 0, exp, result;
    int cnt = 0, e = 0, fexp = 0, temp;
    /* when input is 0 */
    if (!input) {
        return 0;
    }
    if (input > 4290772992) {
        exp = 63 << 9;
        frac = 0;
        s = 0 << 15;
        return exp + s + frac;
    }
    if (input < -4290772992) {
        exp = 63 << 9;
        frac = 0;
        s = 1 << 15;
        return exp + s + frac;
    }
    for (int i = 0; i < 32; i++) {
        temp = (fTemp >> (31 - i)) & 1;
        if (i == 0) {
            s = temp << 15;
        }
        else if (1 <= i && i <= 8) {
            fexp += temp * (1 << (8 - i));
        }
        else {
            frac += temp << (17 - i);
        }
    }
    exp = (fexp - 96) << 9;
    result = s + exp + frac;
    return result;
}

float sfp2float(sfp input){
    float result;
    int s = 1 - 2 * SIG(input);
    int e = E(input);
    float m = FRAC(input);

    result = s * m * pow(2, e - 9);
    return result;
}

sfp sfp_add(sfp a, sfp b){
    sfp s, exp, frac, temp1, temp2;
    int subE, er;
    unsigned int ma = FRAC(a), mb=FRAC(b), mr;
    temp1 = a << 1;
    temp2 = b << 1;
    /* Special Values */
    if(EXP(a)==63){
        if((EXP(b)==63 && SIG(a)!=SIG(b)) || ma > 1){
            return a+1;
        }
        return a;
    }
    else{
        if(EXP(b)==63){
            if(mb > 1){
                return b+1;
            }
            return b;
        }
        /* Special Values END */
        if(temp1 > temp2){ 
            s = SIG(a);
        }
        else{ 
            s = SIG(b);
        }
        if(SIG(a) == SIG(b)){
            /* Addition */
            ma <<= 19;
            mb <<= 19;

            if (E(a) > E(b)){
                subE = E(a) - E(b);
                mb = mb >> subE;
                er = E(a);
            }
            else {
                subE = E(b) - E(a);
                ma = ma >> subE;
                er = E(b);
            }
            mr = ma + mb;
            if (mr & (1 << 29)){
                er++;
                mr = mr >> 1;
            }
            mr -= 1 << 28;
            /* Rounding */
            if (mr & ((1 << 18) - 1)){
                mr += (mr & (1 << 18));
            }
            else if ((mr & (1 << 18)) && (mr & (1 << 19))){
                mr += 1 << 19;
            }
            mr >>= 19;
            if(er>31){
                return((s << 15) + (63<<9) + 0);
            }
            return ((s << 15) + ((er + 31) << 9) + (mr));
        }
        /* Subtraction */
        else{
            ma <<= 19;
            mb <<= 19;

            if (E(a) > E(b)){
                subE = E(a) - E(b);
                mb = mb >> subE;
                er = E(a);
            }
            else{
                subE = E(b) - E(a);
                ma = ma >> subE;
                er = E(b);
            }
            if(temp1 > temp2){
                mr = ma - mb;
            }
            else{
                mr = mb - ma;
            }
            while(!(mr&(1<<28))){
                mr <<= 1;
                er --;
            }
            mr -= 1 << 28;
            /* Rounding */
            if (mr & ((1 << 18) - 1)){
                mr += (mr & (1 << 18));
            }
            else if ((mr & (1 << 18)) && (mr & (1 << 19))){
                mr += 1 << 19;
            }
            mr >>= 19;
            return ((s << 15) + ((er + 31) << 9) + (mr));
        }
    }
}


char* sfp2bits(sfp result){
    char *str;
    str = malloc(sizeof(char) * 17);
    if(!result){
        str = "+0.0";
    }
    for(int i=0; i<16; i++){
        str[i] = ((result >> (15-i)) & 1) ? '1' : '0';
    }
    str[16] = '\0';
    return str;
}
