/****************************************************************************
**
**  This file is part of GAP, a system for computational discrete algebra.
**
**  Copyright of GAP belongs to its developers, whose names are too numerous
**  to list here. Please refer to the COPYRIGHT file for details.
**
**  SPDX-License-Identifier: GPL-2.0-or-later
**
**  This file declares the functions of the GAP to C compiler.
*/

#ifndef GAP_COMPILER_H
#define GAP_COMPILER_H

#include "common.h"

/****************************************************************************
**
*F  CompileFunc( <filename>, <func>, <name>, <crc>, <magic2> ) . . compile
*/
Int CompileFunc(Obj filename, Obj func, Obj name, Int crc, Obj magic2);


/****************************************************************************
**
*F * * * * * * * * * * * * * initialize module * * * * * * * * * * * * * * *
*/

/****************************************************************************
**
*F  InitInfoCompiler() . . . . . . . . . . . . . . .  table of init functions
*/
StructInitInfo * InitInfoCompiler ( void );


#endif // GAP_COMPILER_H
