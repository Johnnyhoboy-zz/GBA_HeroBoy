
//{{BLOCK(info)

//======================================================================
//
//	info, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 349 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11168 + 2048 = 13728
//
//	Time-stamp: 2017-12-05, 23:45:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INFO_H
#define GRIT_INFO_H

#define infoTilesLen 11168
extern const unsigned short infoTiles[5584];

#define infoMapLen 2048
extern const unsigned short infoMap[1024];

#define infoPalLen 512
extern const unsigned short infoPal[256];

#endif // GRIT_INFO_H

//}}BLOCK(info)
