//
//  StateRI.m
//  RI Traffic
//
//  Created by Ryan on 6/10/11.
//  Copyright 2011 Freelance Web Developer. All rights reserved.
//

#import "StateRI.h"

@implementation StateRI

+(NSString*)urlFromCamera:(Camera*)cam {
    NSInteger ident = [cam.ident integerValue];
    return [NSString stringWithFormat:@"http://www.tmc.state.ri.us/_camImgs_/cam%03d/snap.jpg", ident];
}

+(NSTimeInterval)updateTime { return 30.0; }

+(NSArray*)cameras {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:[Camera cameraWithState:self lat:45.164021f lon:-93.378265f ident:@"64" info:@"Route 116 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8701779f lon:-71.5307239f ident:@"67" info:@"Route 44 and Route 5"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8707099f lon:-71.5142863f ident:@"59" info:@"Route 44 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8707099f lon:-71.5142863f ident:@"83" info:@"I-295 and Route 44"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8319606f lon:-71.5161084f ident:@"79" info:@"I-295 S and Route 6"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"78" info:@"I-295 N and Exit 6"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"84" info:@"I-295 N before Exit 10"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"50" info:@"Route 146 and Route 116"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"63" info:@"Route 146 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.9685245f lon:-71.5050501f ident:@"52" info:@"Route 146N and Route 146A"]];
    [arr addObject:[Camera cameraWithState:self lat:41.9685245f lon:-71.5050501f ident:@"62" info:@"Route 146S and Route 146A"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"92" info:@"Route 6 bypass and Route 101"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"104" info:@"Route 146N before Great Rd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"63" info:@"Route 146 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.9685245f lon:-71.5050501f ident:@"52" info:@"Route 146N and Route 146A"]];
    [arr addObject:[Camera cameraWithState:self lat:41.9685245f lon:-71.5050501f ident:@"62" info:@"Route 146S and Route 146A"]];
    [arr addObject:[Camera cameraWithState:self lat:38.6404512f lon:-99.9311786f ident:@"23" info:@"I-95 and School St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8792469f lon:-71.3787839f ident:@"24" info:@"I-95 and Broadway"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7152175f lon:-71.4708728f ident:@"25" info:@"I-95 and East St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"50" info:@"Route 146 and Route 116"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"84" info:@"I-295 N before Exit 10"]];
    [arr addObject:[Camera cameraWithState:self lat:45.164021f lon:-93.378265f ident:@"64" info:@"Route 116 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8707099f lon:-71.5142863f ident:@"83" info:@"I-295 and Route 44"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8701779f lon:-71.5307239f ident:@"67" info:@"Route 44 and Route 5"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"89" info:@"Route 146 S and Branch"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8712068f lon:-71.3996445f ident:@"90" info:@"95 N and Lonsdale"]];
    [arr addObject:[Camera cameraWithState:self lat:39.1754079f lon:-84.4590014f ident:@"91" info:@"95 S and Garden St"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"48" info:@"DMS Route 146"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"103" info:@"Route 4 and Frenchtown Rd."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"77" info:@"I-95 and Cowesett Rd. DMS"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7247911f lon:-71.4492493f ident:@"56" info:@"Airport Connector"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"61" info:@"I-95 SB and Exit 5 DMS"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"55" info:@"Route 2 and Metlife"]];
    [arr addObject:[Camera cameraWithState:self lat:41.754172f lon:-71.4852661f ident:@"51" info:@"Route 37 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.6506706f lon:-71.4575355f ident:@"53" info:@"Route 1 and East Greenwich"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"43" info:@"DMS I-95 SB Laurens St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.782626f lon:-71.4242922f ident:@"1" info:@"I-95 and Route 10"]];
    [arr addObject:[Camera cameraWithState:self lat:41.6285757f lon:-71.4799109f ident:@"26" info:@"Route 402"]];
    [arr addObject:[Camera cameraWithState:self lat:41.6182688f lon:-71.4719017f ident:@"27" info:@"Route 403"]];
    [arr addObject:[Camera cameraWithState:self lat:41.610313f lon:-83.721276f ident:@"40" info:@"Route 2 and I-295"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7004559f lon:-71.5842475f ident:@"39" info:@"Route 117"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"49" info:@"I-95: Cell Tower"]];
    [arr addObject:[Camera cameraWithState:self lat:41.734335f lon:-71.4409899f ident:@"69" info:@"Jefferson Blvd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7372566f lon:-71.4443825f ident:@"68" info:@"Service Ave"]];
    [arr addObject:[Camera cameraWithState:self lat:41.582584f lon:-71.4357069f ident:@"71" info:@"Route 4 and Middle Rd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.780972f lon:-71.472191f ident:@"86" info:@"Route 5 and Phenix Ave"]];
    [arr addObject:[Camera cameraWithState:self lat:41.6401029f lon:-71.2042617f ident:@"97" info:@"Route 24 and Main Rd."]];
    [arr addObject:[Camera cameraWithState:self lat:41.7891039f lon:-71.3323756f ident:@"82" info:@"Route 114 and Mink St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"65" info:@"Portsmouth Maintenance Facility"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"66" info:@"Route 24 Sakonnet River Bridge"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5125356f lon:-71.313203f ident:@"57" info:@"JT Connell and Girard Rd. (Newport)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5269198f lon:-71.3946252f ident:@"45" info:@"Jamestown Bridge (Jamestown)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7028141f lon:-71.2654032f ident:@"38" info:@"Route 136"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7980948f lon:-71.3633813f ident:@"37" info:@"Route 114"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5079276f lon:-71.311351f ident:@"72" info:@"Admiral Kalbfus Rd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5218122f lon:-71.2831374f ident:@"87" info:@"Route 138 and Route 138A"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5189231f lon:-71.2933575f ident:@"88" info:@"Route 138 and Route 214"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7368711f lon:-71.2745264f ident:@"93" info:@"Route 136 and Market St"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"94" info:@"Route 114 and Evergreen St"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7891039f lon:-71.3323756f ident:@"82" info:@"Route 114 and Mink St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8292492f lon:-71.4267321f ident:@"30" info:@"Promenade and Dean"]];
    [arr addObject:[Camera cameraWithState:self lat:41.82866f lon:-71.41538f ident:@"29" info:@"Providence Place Mall"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8672694f lon:-71.438507f ident:@"54" info:@"Mineral Spring Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"28" info:@"Memorial and Steeple"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"48" info:@"DMS Route 146"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"42" info:@"DMS I-95 NB and Smithfield Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8446026f lon:-71.411372f ident:@"11" info:@"I-95 and Branch"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"10" info:@"I-95 and Orms"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"9" info:@"I-95 and Kinsley"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8792469f lon:-71.3787839f ident:@"8" info:@"I-95 and Broadway"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"22" info:@"Route 10/6 and Dean"]];
    [arr addObject:[Camera cameraWithState:self lat:35.1779548f lon:-79.3856389f ident:@"7" info:@"I-95 and Broad"]];
    [arr addObject:[Camera cameraWithState:self lat:42.003296f lon:-71.526482f ident:@"12" info:@"I-195 and Chestnut"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"6" info:@"I-95 and Friendship"]];
    [arr addObject:[Camera cameraWithState:self lat:42.4785015f lon:-84.5993858f ident:@"5" info:@"I-95 and Public"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8107183f lon:-71.4070463f ident:@"105" info:@"I-95 and Eddy"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"106" info:@"I-195 and India"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8006297f lon:-71.4036017f ident:@"4" info:@"I-95 and Thurbers"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"3" info:@"I-95 and Detroit"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7814212f lon:-71.4207189f ident:@"2" info:@"I-95 and Elmwood"]];
    [arr addObject:[Camera cameraWithState:self lat:41.782626f lon:-71.4242922f ident:@"1" info:@"I-95 and Route 10"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"13" info:@"I-195 and Point St."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"14" info:@"I-195 and Gano St."]];
    [arr addObject:[Camera cameraWithState:self lat:38.9186183f lon:-77.0035473f ident:@"15" info:@"I-195 Washington Bridge"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"21" info:@"Route 6/10 Tobey"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8169858f lon:-71.4392209f ident:@"20" info:@"Route 10 and 6"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8070529f lon:-71.4411633f ident:@"19" info:@"Route 10 and Union"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"18" info:@"Route 10 and Kenwood"]];
    [arr addObject:[Camera cameraWithState:self lat:41.7858839f lon:-71.4333626f ident:@"17" info:@"Route 10 and Resevoir"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8383479f lon:-71.4092249f ident:@"74" info:@"North Main St. and Doyle Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8420677f lon:-71.4079264f ident:@"73" info:@"North Main St. and Branch Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"75" info:@"Allens Ave. DPW"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"76" info:@"Route 6 DMS"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"46" info:@"DMS Route I-195"]];
    [arr addObject:[Camera cameraWithState:self lat:41.864719f lon:-71.372581f ident:@"16" info:@"I-195 and 114"]];
    [arr addObject:[Camera cameraWithState:self lat:41.818981f lon:-71.461578f ident:@"80" info:@"Route 6 and Glenbridge Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8302854f lon:-71.5306454f ident:@"81" info:@"Route 6 and Hartford Ave."]];
    [arr addObject:[Camera cameraWithState:self lat:41.8319606f lon:-71.5161084f ident:@"79" info:@"I-295 S and Route 6"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8319606f lon:-71.5161084f ident:@"78" info:@"I-295 N and Route 6"]];
    [arr addObject:[Camera cameraWithState:self lat:41.780972f lon:-71.472191f ident:@"86" info:@"Route 5 and Phenix Ave"]];
    [arr addObject:[Camera cameraWithState:self lat:41.8176379f lon:-71.4970864f ident:@"85" info:@"Route 6 and Atwood"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"89" info:@"Route 146 S and Branch"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5607876f lon:-71.4895375f ident:@"96" info:@"Route 4 and Oak Hill Rd."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"60" info:@"I-95 NB and CT state line DMS"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5292464f lon:-71.4082164f ident:@"44" info:@"Jamestown Bridge (N. Kingstown)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5269198f lon:-71.3946252f ident:@"45" info:@"Jamestown Bridge (Jamestown)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"47" info:@"DMS Route 4"]];
    [arr addObject:[Camera cameraWithState:self lat:41.6043828f lon:-71.4564884f ident:@"27" info:@"Route 1 and Route 403"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5452981f lon:-71.4768712f ident:@"36" info:@"Route 4 and West Allenton Rd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.4948053f lon:-71.456621f ident:@"34" info:@"Route 1 and Route 138 (S. Kingstown)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5393697f lon:-71.4687053f ident:@"35" info:@"Route 1 and Route 4"]];
    [arr addObject:[Camera cameraWithState:self lat:41.3574073f lon:-71.8075774f ident:@"32" info:@"Route 1 and Route 78"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"41" info:@"Route 1 and Saugatucket Rd."]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"33" info:@"Government Center"]];
    [arr addObject:[Camera cameraWithState:self lat:41.4948053f lon:-71.456621f ident:@"70" info:@"Route 138 and Route 1A"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"61" info:@"I-95 SB and Exit 5 DMS"]];
    [arr addObject:[Camera cameraWithState:self lat:41.530453f lon:-71.4663159f ident:@"58" info:@"Route 1 and Route 138 (N. Kingstown)"]];
    [arr addObject:[Camera cameraWithState:self lat:41.4140678f lon:-71.5283953f ident:@"95" info:@"Route 1 and Camp Fuller Rd"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"98" info:@"95 S and Exit 1"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"99" info:@"95 S and Exit 2"]];
    [arr addObject:[Camera cameraWithState:self lat:41.5800945f lon:-71.4774291f ident:@"101" info:@"95 S and Exit 4"]];
    return [arr autorelease];
}

@end
