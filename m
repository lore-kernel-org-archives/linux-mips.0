Received: from [83.72.98.85] (HELO ANNEMETTE)
  by mailfe10.swip.net (CommuniGate Pro SMTP 4.2.7)
  with ESMTP id 51742562 for linux-mips@linux-mips.org; Wed, 29 Dec 2004 10:28:47 +0100
From: =?iso-8859-1?Q?J=F8rg_Ulrich_Hansen?= <jh@hansen-telecom.dk>
Subject: Request for new machtype
Date: Wed, 29 Dec 2004 10:29:46 +0100
Message-ID: <000201c4ed88$efdc64b0$040ba8c0@ANNEMETTE>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <jh@hansen-telecom.dk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041229092946.5wtLRoH18OuUa4Xh0_hKOOYdM01V6cnG8LwDp7fWRH0@z>

Hi

We are the manufacture of a cpu module based on ADMs Alchemy au1100 and
would like a machtype as defined in bootinfo.h

I have included a patch that defines MACH_MB1100 as 9 but would like to
have it confirm so we are not running into conflicts in the future.

Index: linux267/include/asm-mips/bootinfo.h
===================================================================
RCS file: /home/cvs/linux/include/asm-mips/bootinfo.h,v
retrieving revision 1.74
diff -u -p -r1.74 bootinfo.h
--- linux267/include/asm-mips/bootinfo.h	13 Apr 2004 22:07:45
-0000	1.74
+++ linux267/include/asm-mips/bootinfo.h	27 Nov 2004 16:20:31
-0000
@@ -174,6 +174,7 @@
 #define  MACH_XXS1500		6       /* Au1500-based eval board */
 #define  MACH_MTX1		7       /* 4G MTX-1 Au1500-based board
*/
 #define  MACH_PB1550		8       /* Au1550-based eval board */
+#define  MACH_MB1100		9   /* Mechatronic Brick mb1100 module
*/
 
 /*
  * Valid machtype for group NEC_VR41XX 

Kind regards Jorg Hansen

This is not advertising but more information about the module as well as
crosstool based on buildroot and patches can be found at:
http://www.mechatronicbrick.dk/uk/mb1100.html


 
