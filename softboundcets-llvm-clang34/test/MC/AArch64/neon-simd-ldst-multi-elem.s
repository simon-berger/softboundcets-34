// RUN: llvm-mc -triple=aarch64 -mattr=+neon -show-encoding < %s | FileCheck %s

// Check that the assembler can handle the documented syntax for AArch64

//------------------------------------------------------------------------------
// Store multiple 1-element structures from one register
//------------------------------------------------------------------------------
         st1 {v0.16b}, [x0]
         st1 {v15.8h}, [x15]
         st1 {v31.4s}, [sp]
         st1 {v0.2d}, [x0]
         st1 {v0.8b}, [x0]
         st1 {v15.4h}, [x15]
         st1 {v31.2s}, [sp]
         st1 {v0.1d}, [x0]
// CHECK:	st1	{v0.16b}, [x0]          // encoding: [0x00,0x70,0x00,0x4c]
// CHECK:	st1	{v15.8h}, [x15]         // encoding: [0xef,0x75,0x00,0x4c]
// CHECK:	st1	{v31.4s}, [sp]          // encoding: [0xff,0x7b,0x00,0x4c]
// CHECK:	st1	{v0.2d}, [x0]           // encoding: [0x00,0x7c,0x00,0x4c]
// CHECK:	st1	{v0.8b}, [x0]           // encoding: [0x00,0x70,0x00,0x0c]
// CHECK:	st1	{v15.4h}, [x15]         // encoding: [0xef,0x75,0x00,0x0c]
// CHECK:	st1	{v31.2s}, [sp]          // encoding: [0xff,0x7b,0x00,0x0c]
// CHECK:	st1	{v0.1d}, [x0]           // encoding: [0x00,0x7c,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 1-element structures from two consecutive registers
//------------------------------------------------------------------------------
         st1 {v0.16b, v1.16b}, [x0]
         st1 {v15.8h, v16.8h}, [x15]
         st1 {v31.4s, v0.4s}, [sp]
         st1 {v0.2d, v1.2d}, [x0]
         st1 {v0.8b, v1.8b}, [x0]
         st1 {v15.4h, v16.4h}, [x15]
         st1 {v31.2s, v0.2s}, [sp]
         st1 {v0.1d, v1.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0xa0,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0xa5,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0xab,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0xac,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0xa0,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0xa5,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0xab,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d}, [x0]    // encoding: [0x00,0xac,0x00,0x0c]

         st1 {v0.16b-v1.16b}, [x0]
         st1 {v15.8h-v16.8h}, [x15]
         st1 {v31.4s-v0.4s}, [sp]
         st1 {v0.2d-v1.2d}, [x0]
         st1 {v0.8b-v1.8b}, [x0]
         st1 {v15.4h-v16.4h}, [x15]
         st1 {v31.2s-v0.2s}, [sp]
         st1 {v0.1d-v1.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0xa0,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0xa5,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0xab,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0xac,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0xa0,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0xa5,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0xab,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d}, [x0]    // encoding: [0x00,0xac,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 1-element structures from three consecutive registers
//------------------------------------------------------------------------------
         st1 {v0.16b, v1.16b, v2.16b}, [x0]
         st1 {v15.8h, v16.8h, v17.8h}, [x15]
         st1 {v31.4s, v0.4s, v1.4s}, [sp]
         st1 {v0.2d, v1.2d, v2.2d}, [x0]
         st1 {v0.8b, v1.8b, v2.8b}, [x0]
         st1 {v15.4h, v16.4h, v17.4h}, [x15]
         st1 {v31.2s, v0.2s, v1.2s}, [sp]
         st1 {v0.1d, v1.1d, v2.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x60,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x65,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x6b,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x6c,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x60,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x65,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x6b,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d, v2.1d}, [x0] // encoding: [0x00,0x6c,0x00,0x0c]

         st1 {v0.16b-v2.16b}, [x0]
         st1 {v15.8h-v17.8h}, [x15]
         st1 {v31.4s-v1.4s}, [sp]
         st1 {v0.2d-v2.2d}, [x0]
         st1 {v0.8b-v2.8b}, [x0]
         st1 {v15.4h-v17.4h}, [x15]
         st1 {v31.2s-v1.2s}, [sp]
         st1 {v0.1d-v2.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x60,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x65,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x6b,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x6c,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x60,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x65,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x6b,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d, v2.1d}, [x0] // encoding: [0x00,0x6c,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 1-element structures from four consecutive registers
//------------------------------------------------------------------------------
         st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [x0]
         st1 {v15.8h, v16.8h, v17.8h, v18.8h}, [x15]
         st1 {v31.4s, v0.4s, v1.4s, v2.4s}, [sp]
         st1 {v0.2d, v1.2d, v2.2d, v3.2d}, [x0]
         st1 {v0.8b, v1.8b, v2.8b, v3.8b}, [x0]
         st1 {v15.4h, v16.4h, v17.4h, v18.4h}, [x15]
         st1 {v31.2s, v0.2s, v1.2s, v2.2s}, [sp]
         st1 {v0.1d, v1.1d, v2.1d, v3.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x20,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x25,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x2b,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x2c,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x20,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x25,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x2b,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d, v2.1d, v3.1d}, [x0] // encoding: [0x00,0x2c,0x00,0x0c]

         st1 {v0.16b-v3.16b}, [x0]
         st1 {v15.8h-v18.8h}, [x15]
         st1 {v31.4s-v2.4s}, [sp]
         st1 {v0.2d-v3.2d}, [x0]
         st1 {v0.8b-v3.8b}, [x0]
         st1 {v15.4h-v18.4h}, [x15]
         st1 {v31.2s-v2.2s}, [sp]
         st1 {v0.1d-v3.1d}, [x0]
// CHECK:	st1	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x20,0x00,0x4c]
// CHECK:	st1	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x25,0x00,0x4c]
// CHECK:	st1	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x2b,0x00,0x4c]
// CHECK:	st1	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x2c,0x00,0x4c]
// CHECK:	st1	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x20,0x00,0x0c]
// CHECK:	st1	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x25,0x00,0x0c]
// CHECK:	st1	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x2b,0x00,0x0c]
// CHECK:	st1	{v0.1d, v1.1d, v2.1d, v3.1d}, [x0] // encoding: [0x00,0x2c,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 2-element structures from two consecutive registers
//------------------------------------------------------------------------------
         st2 {v0.16b, v1.16b}, [x0]
         st2 {v15.8h, v16.8h}, [x15]
         st2 {v31.4s, v0.4s}, [sp]
         st2 {v0.2d, v1.2d}, [x0]
         st2 {v0.8b, v1.8b}, [x0]
         st2 {v15.4h, v16.4h}, [x15]
         st2 {v31.2s, v0.2s}, [sp]
// CHECK:	st2	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0x80,0x00,0x4c]
// CHECK:	st2	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0x85,0x00,0x4c]
// CHECK:	st2	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0x8b,0x00,0x4c]
// CHECK:	st2	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0x8c,0x00,0x4c]
// CHECK:	st2	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0x80,0x00,0x0c]
// CHECK:	st2	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0x85,0x00,0x0c]
// CHECK:	st2	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0x8b,0x00,0x0c]

         st2 {v0.16b-v1.16b}, [x0]
         st2 {v15.8h-v16.8h}, [x15]
         st2 {v31.4s-v0.4s}, [sp]
         st2 {v0.2d-v1.2d}, [x0]
         st2 {v0.8b-v1.8b}, [x0]
         st2 {v15.4h-v16.4h}, [x15]
         st2 {v31.2s-v0.2s}, [sp]
// CHECK:	st2	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0x80,0x00,0x4c]
// CHECK:	st2	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0x85,0x00,0x4c]
// CHECK:	st2	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0x8b,0x00,0x4c]
// CHECK:	st2	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0x8c,0x00,0x4c]
// CHECK:	st2	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0x80,0x00,0x0c]
// CHECK:	st2	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0x85,0x00,0x0c]
// CHECK:	st2	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0x8b,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 3-element structures from three consecutive registers
//------------------------------------------------------------------------------
         st3 {v0.16b, v1.16b, v2.16b}, [x0]
         st3 {v15.8h, v16.8h, v17.8h}, [x15]
         st3 {v31.4s, v0.4s, v1.4s}, [sp]
         st3 {v0.2d, v1.2d, v2.2d}, [x0]
         st3 {v0.8b, v1.8b, v2.8b}, [x0]
         st3 {v15.4h, v16.4h, v17.4h}, [x15]
         st3 {v31.2s, v0.2s, v1.2s}, [sp]
// CHECK:	st3	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x40,0x00,0x4c]
// CHECK:	st3	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x45,0x00,0x4c]
// CHECK:	st3	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x4b,0x00,0x4c]
// CHECK:	st3	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x4c,0x00,0x4c]
// CHECK:	st3	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x40,0x00,0x0c]
// CHECK:	st3	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x45,0x00,0x0c]
// CHECK:	st3	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x4b,0x00,0x0c]

         st3 {v0.16b-v2.16b}, [x0]
         st3 {v15.8h-v17.8h}, [x15]
         st3 {v31.4s-v1.4s}, [sp]
         st3 {v0.2d-v2.2d}, [x0]
         st3 {v0.8b-v2.8b}, [x0]
         st3 {v15.4h-v17.4h}, [x15]
         st3 {v31.2s-v1.2s}, [sp]
// CHECK:	st3	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x40,0x00,0x4c]
// CHECK:	st3	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x45,0x00,0x4c]
// CHECK:	st3	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x4b,0x00,0x4c]
// CHECK:	st3	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x4c,0x00,0x4c]
// CHECK:	st3	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x40,0x00,0x0c]
// CHECK:	st3	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x45,0x00,0x0c]
// CHECK:	st3	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x4b,0x00,0x0c]

//------------------------------------------------------------------------------
// Store multiple 4-element structures from four consecutive registers
//------------------------------------------------------------------------------
         st4 {v0.16b, v1.16b, v2.16b, v3.16b}, [x0]
         st4 {v15.8h, v16.8h, v17.8h, v18.8h}, [x15]
         st4 {v31.4s, v0.4s, v1.4s, v2.4s}, [sp]
         st4 {v0.2d, v1.2d, v2.2d, v3.2d}, [x0]
         st4 {v0.8b, v1.8b, v2.8b, v3.8b}, [x0]
         st4 {v15.4h, v16.4h, v17.4h, v18.4h}, [x15]
         st4 {v31.2s, v0.2s, v1.2s, v2.2s}, [sp]
// CHECK:	st4	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x00,0x00,0x4c]
// CHECK:	st4	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x05,0x00,0x4c]
// CHECK:	st4	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x0b,0x00,0x4c]
// CHECK:	st4	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x0c,0x00,0x4c]
// CHECK:	st4	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x00,0x00,0x0c]
// CHECK:	st4	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x05,0x00,0x0c]
// CHECK:	st4	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x0b,0x00,0x0c]

         st4 {v0.16b-v3.16b}, [x0]
         st4 {v15.8h-v18.8h}, [x15]
         st4 {v31.4s-v2.4s}, [sp]
         st4 {v0.2d-v3.2d}, [x0]
         st4 {v0.8b-v3.8b}, [x0]
         st4 {v15.4h-v18.4h}, [x15]
         st4 {v31.2s-v2.2s}, [sp]
// CHECK:	st4	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x00,0x00,0x4c]
// CHECK:	st4	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x05,0x00,0x4c]
// CHECK:	st4	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x0b,0x00,0x4c]
// CHECK:	st4	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x0c,0x00,0x4c]
// CHECK:	st4	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x00,0x00,0x0c]
// CHECK:	st4	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x05,0x00,0x0c]
// CHECK:	st4	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x0b,0x00,0x0c]

//------------------------------------------------------------------------------
// Load multiple 1-element structures to one register
//------------------------------------------------------------------------------
         ld1 {v0.16b}, [x0]
         ld1 {v15.8h}, [x15]
         ld1 {v31.4s}, [sp]
         ld1 {v0.2d}, [x0]
         ld1 {v0.8b}, [x0]
         ld1 {v15.4h}, [x15]
         ld1 {v31.2s}, [sp]
         ld1 {v0.1d}, [x0]
// CHECK:	ld1	{v0.16b}, [x0]          // encoding: [0x00,0x70,0x40,0x4c]
// CHECK:	ld1	{v15.8h}, [x15]         // encoding: [0xef,0x75,0x40,0x4c]
// CHECK:	ld1	{v31.4s}, [sp]          // encoding: [0xff,0x7b,0x40,0x4c]
// CHECK:	ld1	{v0.2d}, [x0]           // encoding: [0x00,0x7c,0x40,0x4c]
// CHECK:	ld1	{v0.8b}, [x0]           // encoding: [0x00,0x70,0x40,0x0c]
// CHECK:	ld1	{v15.4h}, [x15]         // encoding: [0xef,0x75,0x40,0x0c]
// CHECK:	ld1	{v31.2s}, [sp]          // encoding: [0xff,0x7b,0x40,0x0c]
// CHECK:	ld1	{v0.1d}, [x0]           // encoding: [0x00,0x7c,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 1-element structures to two consecutive registers
//------------------------------------------------------------------------------
         ld1 {v0.16b, v1.16b}, [x0]
         ld1 {v15.8h, v16.8h}, [x15]
         ld1 {v31.4s, v0.4s}, [sp]
         ld1 {v0.2d, v1.2d}, [x0]
         ld1 {v0.8b, v1.8b}, [x0]
         ld1 {v15.4h, v16.4h}, [x15]
         ld1 {v31.2s, v0.2s}, [sp]
         ld1 {v0.1d, v1.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0xa0,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0xa5,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0xab,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0xac,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0xa0,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0xa5,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0xab,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d}, [x0]    // encoding: [0x00,0xac,0x40,0x0c]

         ld1 {v0.16b-v1.16b}, [x0]
         ld1 {v15.8h-v16.8h}, [x15]
         ld1 {v31.4s-v0.4s}, [sp]
         ld1 {v0.2d-v1.2d}, [x0]
         ld1 {v0.8b-v1.8b}, [x0]
         ld1 {v15.4h-v16.4h}, [x15]
         ld1 {v31.2s-v0.2s}, [sp]
         ld1 {v0.1d-v1.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0xa0,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0xa5,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0xab,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0xac,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0xa0,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0xa5,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0xab,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d}, [x0]    // encoding: [0x00,0xac,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 1-element structures to three consecutive registers
//------------------------------------------------------------------------------
         ld1 {v0.16b, v1.16b, v2.16b}, [x0]
         ld1 {v15.8h, v16.8h, v17.8h}, [x15]
         ld1 {v31.4s, v0.4s, v1.4s}, [sp]
         ld1 {v0.2d, v1.2d, v2.2d}, [x0]
         ld1 {v0.8b, v1.8b, v2.8b}, [x0]
         ld1 {v15.4h, v16.4h, v17.4h}, [x15]
         ld1 {v31.2s, v0.2s, v1.2s}, [sp]
         ld1 {v0.1d, v1.1d, v2.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x60,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x65,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x6b,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x6c,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x60,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x65,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x6b,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d, v2.1d}, [x0] // encoding: [0x00,0x6c,0x40,0x0c]

         ld1 {v0.16b-v2.16b}, [x0]
         ld1 {v15.8h-v17.8h}, [x15]
         ld1 {v31.4s-v1.4s}, [sp]
         ld1 {v0.2d-v2.2d}, [x0]
         ld1 {v0.8b-v2.8b}, [x0]
         ld1 {v15.4h-v17.4h}, [x15]
         ld1 {v31.2s-v1.2s}, [sp]
         ld1 {v0.1d-v2.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x60,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x65,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x6b,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x6c,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x60,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x65,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x6b,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d, v2.1d}, [x0] // encoding: [0x00,0x6c,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 1-element structures to four consecutive registers
//------------------------------------------------------------------------------
         ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [x0]
         ld1 {v15.8h, v16.8h, v17.8h, v18.8h}, [x15]
         ld1 {v31.4s, v0.4s, v1.4s, v2.4s}, [sp]
         ld1 {v0.2d, v1.2d, v2.2d, v3.2d}, [x0]
         ld1 {v0.8b, v1.8b, v2.8b, v3.8b}, [x0]
         ld1 {v15.4h, v16.4h, v17.4h, v18.4h}, [x15]
         ld1 {v31.2s, v0.2s, v1.2s, v2.2s}, [sp]
         ld1 {v0.1d, v1.1d, v2.1d, v3.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x20,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x25,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x2b,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x2c,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x20,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x25,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x2b,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d, v2.1d, v3.1d}, [x0] // encoding: [0x00,0x2c,0x40,0x0c]

         ld1 {v0.16b-v3.16b}, [x0]
         ld1 {v15.8h-v18.8h}, [x15]
         ld1 {v31.4s-v2.4s}, [sp]
         ld1 {v0.2d-v3.2d}, [x0]
         ld1 {v0.8b-v3.8b}, [x0]
         ld1 {v15.4h-v18.4h}, [x15]
         ld1 {v31.2s-v2.2s}, [sp]
         ld1 {v0.1d-v3.1d}, [x0]
// CHECK:	ld1	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x20,0x40,0x4c]
// CHECK:	ld1	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x25,0x40,0x4c]
// CHECK:	ld1	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x2b,0x40,0x4c]
// CHECK:	ld1	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x2c,0x40,0x4c]
// CHECK:	ld1	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x20,0x40,0x0c]
// CHECK:	ld1	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x25,0x40,0x0c]
// CHECK:	ld1	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x2b,0x40,0x0c]
// CHECK:	ld1	{v0.1d, v1.1d, v2.1d, v3.1d}, [x0] // encoding: [0x00,0x2c,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 4-element structures to two consecutive registers
//------------------------------------------------------------------------------
         ld2 {v0.16b, v1.16b}, [x0]
         ld2 {v15.8h, v16.8h}, [x15]
         ld2 {v31.4s, v0.4s}, [sp]
         ld2 {v0.2d, v1.2d}, [x0]
         ld2 {v0.8b, v1.8b}, [x0]
         ld2 {v15.4h, v16.4h}, [x15]
         ld2 {v31.2s, v0.2s}, [sp]
// CHECK:	ld2	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0x80,0x40,0x4c]
// CHECK:	ld2	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0x85,0x40,0x4c]
// CHECK:	ld2	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0x8b,0x40,0x4c]
// CHECK:	ld2	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0x8c,0x40,0x4c]
// CHECK:	ld2	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0x80,0x40,0x0c]
// CHECK:	ld2	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0x85,0x40,0x0c]
// CHECK:	ld2	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0x8b,0x40,0x0c]

         ld2 {v0.16b-v1.16b}, [x0]
         ld2 {v15.8h-v16.8h}, [x15]
         ld2 {v31.4s-v0.4s}, [sp]
         ld2 {v0.2d-v1.2d}, [x0]
         ld2 {v0.8b-v1.8b}, [x0]
         ld2 {v15.4h-v16.4h}, [x15]
         ld2 {v31.2s-v0.2s}, [sp]
// CHECK:	ld2	{v0.16b, v1.16b}, [x0]  // encoding: [0x00,0x80,0x40,0x4c]
// CHECK:	ld2	{v15.8h, v16.8h}, [x15] // encoding: [0xef,0x85,0x40,0x4c]
// CHECK:	ld2	{v31.4s, v0.4s}, [sp]   // encoding: [0xff,0x8b,0x40,0x4c]
// CHECK:	ld2	{v0.2d, v1.2d}, [x0]    // encoding: [0x00,0x8c,0x40,0x4c]
// CHECK:	ld2	{v0.8b, v1.8b}, [x0]    // encoding: [0x00,0x80,0x40,0x0c]
// CHECK:	ld2	{v15.4h, v16.4h}, [x15] // encoding: [0xef,0x85,0x40,0x0c]
// CHECK:	ld2	{v31.2s, v0.2s}, [sp]   // encoding: [0xff,0x8b,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 3-element structures to three consecutive registers
//------------------------------------------------------------------------------
         ld3 {v0.16b, v1.16b, v2.16b}, [x0]
         ld3 {v15.8h, v16.8h, v17.8h}, [x15]
         ld3 {v31.4s, v0.4s, v1.4s}, [sp]
         ld3 {v0.2d, v1.2d, v2.2d}, [x0]
         ld3 {v0.8b, v1.8b, v2.8b}, [x0]
         ld3 {v15.4h, v16.4h, v17.4h}, [x15]
         ld3 {v31.2s, v0.2s, v1.2s}, [sp]
// CHECK:	ld3	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x40,0x40,0x4c]
// CHECK:	ld3	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x45,0x40,0x4c]
// CHECK:	ld3	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x4b,0x40,0x4c]
// CHECK:	ld3	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x4c,0x40,0x4c]
// CHECK:	ld3	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x40,0x40,0x0c]
// CHECK:	ld3	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x45,0x40,0x0c]
// CHECK:	ld3	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x4b,0x40,0x0c]

         ld3 {v0.16b-v2.16b}, [x0]
         ld3 {v15.8h-v17.8h}, [x15]
         ld3 {v31.4s-v1.4s}, [sp]
         ld3 {v0.2d-v2.2d}, [x0]
         ld3 {v0.8b-v2.8b}, [x0]
         ld3 {v15.4h-v17.4h}, [x15]
         ld3 {v31.2s-v1.2s}, [sp]
// CHECK:	ld3	{v0.16b, v1.16b, v2.16b}, [x0] // encoding: [0x00,0x40,0x40,0x4c]
// CHECK:	ld3	{v15.8h, v16.8h, v17.8h}, [x15] // encoding: [0xef,0x45,0x40,0x4c]
// CHECK:	ld3	{v31.4s, v0.4s, v1.4s}, [sp] // encoding: [0xff,0x4b,0x40,0x4c]
// CHECK:	ld3	{v0.2d, v1.2d, v2.2d}, [x0] // encoding: [0x00,0x4c,0x40,0x4c]
// CHECK:	ld3	{v0.8b, v1.8b, v2.8b}, [x0] // encoding: [0x00,0x40,0x40,0x0c]
// CHECK:	ld3	{v15.4h, v16.4h, v17.4h}, [x15] // encoding: [0xef,0x45,0x40,0x0c]
// CHECK:	ld3	{v31.2s, v0.2s, v1.2s}, [sp] // encoding: [0xff,0x4b,0x40,0x0c]

//------------------------------------------------------------------------------
// Load multiple 4-element structures to four consecutive registers
//------------------------------------------------------------------------------
         ld4 {v0.16b, v1.16b, v2.16b, v3.16b}, [x0]
         ld4 {v15.8h, v16.8h, v17.8h, v18.8h}, [x15]
         ld4 {v31.4s, v0.4s, v1.4s, v2.4s}, [sp]
         ld4 {v0.2d, v1.2d, v2.2d, v3.2d}, [x0]
         ld4 {v0.8b, v1.8b, v2.8b, v3.8b}, [x0]
         ld4 {v15.4h, v16.4h, v17.4h, v18.4h}, [x15]
         ld4 {v31.2s, v0.2s, v1.2s, v2.2s}, [sp]
// CHECK:	ld4	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x00,0x40,0x4c]
// CHECK:	ld4	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x05,0x40,0x4c]
// CHECK:	ld4	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x0b,0x40,0x4c]
// CHECK:	ld4	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x0c,0x40,0x4c]
// CHECK:	ld4	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x00,0x40,0x0c]
// CHECK:	ld4	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x05,0x40,0x0c]
// CHECK:	ld4	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x0b,0x40,0x0c]

         ld4 {v0.16b-v3.16b}, [x0]
         ld4 {v15.8h-v18.8h}, [x15]
         ld4 {v31.4s-v2.4s}, [sp]
         ld4 {v0.2d-v3.2d}, [x0]
         ld4 {v0.8b-v3.8b}, [x0]
         ld4 {v15.4h-v18.4h}, [x15]
         ld4 {v31.2s-v2.2s}, [sp]
// CHECK:	ld4	{v0.16b, v1.16b, v2.16b, v3.16b}, [x0] // encoding: [0x00,0x00,0x40,0x4c]
// CHECK:	ld4	{v15.8h, v16.8h, v17.8h, v18.8h}, [x15] // encoding: [0xef,0x05,0x40,0x4c]
// CHECK:	ld4	{v31.4s, v0.4s, v1.4s, v2.4s}, [sp] // encoding: [0xff,0x0b,0x40,0x4c]
// CHECK:	ld4	{v0.2d, v1.2d, v2.2d, v3.2d}, [x0] // encoding: [0x00,0x0c,0x40,0x4c]
// CHECK:	ld4	{v0.8b, v1.8b, v2.8b, v3.8b}, [x0] // encoding: [0x00,0x00,0x40,0x0c]
// CHECK:	ld4	{v15.4h, v16.4h, v17.4h, v18.4h}, [x15] // encoding: [0xef,0x05,0x40,0x0c]
// CHECK:	ld4	{v31.2s, v0.2s, v1.2s, v2.2s}, [sp] // encoding: [0xff,0x0b,0x40,0x0c]
