#define easeElasticOut
///easeElasticOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Elastic Ease for moving controls smoothly

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (_t == 1)
    return _b + _c;
    
_p = _d * .3;
_s = _p / 4;

return (_c * power( 2, -10 * _t ) * sin(((_t*_d)-_s) * (2*pi)/_p) + _c + _b );

//To see copyright notice for this script please click on the following text then press F12:
//ease_CopyrightNotice

