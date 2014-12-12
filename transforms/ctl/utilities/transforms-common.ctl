//
// transforms-common.ctl
//
// Contains functions and constants shared by multiple forward and inverse 
// transforms 
//


import "utilities-color";



const Chromaticities AP1 = 
{
  {0.713,	0.293},
  {0.165,	0.830},
  {0.128,	0.044},
  {0.32168,	0.33767}
};

const float AP0_2_XYZ_MAT[4][4] = RGBtoXYZ( AP0, 1.0);
const float XYZ_2_AP0_MAT[4][4] = XYZtoRGB( AP0, 1.0);

const float AP1_2_XYZ_MAT[4][4] = RGBtoXYZ( AP1, 1.0);
const float XYZ_2_AP1_MAT[4][4] = XYZtoRGB( AP1, 1.0);

const float AP0_2_AP1_MAT[4][4] = mult_f44_f44( AP0_2_XYZ_MAT, XYZ_2_AP1_MAT);
const float AP1_2_ACES_MAT[4][4] = invert_f44( ACES_2_AP1_MAT);

const float AP1_RGB2Y[3] = { AP1_2_XYZ_MAT[0][1], 
                             AP1_2_XYZ_MAT[1][1], 
                             AP1_2_XYZ_MAT[2][1] };



const float TINY = 1e-10;




float rgb_2_saturation( float rgb[3])
{
  return ( max( max_f3(rgb), TINY) - max( min_f3(rgb), TINY)) / max( max_f3(rgb), 1e-2);
}