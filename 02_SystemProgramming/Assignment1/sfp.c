#include "sfp.h"
#include <stdlib.h>
#include <math.h>

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
    int temp;
    int result = 1, s = 1, expo = 0, frac = 1, e;
    for (int i = 0; i < 16; i++) {
        temp = (input >> (15 - i)) & 1;
        if (!i && temp) {
            s *= -1;
        }
        if (1 <= i && i <= 6) {
            expo += temp * (1 << (6 - i));
            if (i == 6){
                e = expo - 31;
                if(e>30){
                    if(s==1){
                        return 2147483647;
                    }
                    else{
                        return -2147483648;
                    }
                }
            }
        }
        if (7 <= i) {
            if (i == 7) {
                frac = frac << e;
            }
            frac += temp * (1 << (6 - i + e));
        }
    }
    result *= s * frac;
    return result;
}

sfp float2sfp(float input){
    sfp s = 0, frac = 0, expo;
    float *sv = &input;
    int cnt = 0, e = 0;
    /* when input is 0 */
    if (!input)
    {
        return 0;
    }
    if (input < 0)
    {
        s = 1 << 15;
    }
    while (sv > 1)
    {
        sv = *sv >> 1;
        cnt++;
    }
    frac += (input << (9 - cnt)) - (1 << 9);
    expo = (cnt + 31) << 9;
    return expo + s + frac;
}

float sfp2float(sfp input){
    float temp;
    float result = 1; 
    int s = 1, expo = 0, frac = 1, e;
    for (int i = 0; i < 16; i++) {
        temp = (input >> (15 - i)) & 1;
        if (!i && temp) {
            s *= -1;
        }
        if (1 <= i && i <= 6) {
            expo += temp * (1 << (6 - i));
            if (i == 6) {
                e = expo - 31;
            }
        }
        if (7 <= i) {
            if (i == 7) {
                frac = frac << e;
            }
            frac += temp * (1 << (6 - i + e));
        }
    }
    result *= s * frac;
    return result;
}

sfp sfp_add(sfp a, sfp b){
}


char* sfp2bits(sfp result){
    char *str;
    str = malloc(sizeof(char) * 17);
    if(!result){
        str = "+0.0";
    }
    for(int i=0; i<16; i++){
        str[i] = (result >> (15-i)) & 1 + '0';
    }
    return str;
}
