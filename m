From: rajesh.palani@philips.com
Subject: sysmips syscall
Message-ID: <0056910008698539000002L192*@MHS>
Date: Fri, 17 Nov 2000 19:28:50 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; name="MEMO 11/17/00 19:26:59"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: linux-mips@oss.sgi.com, linux-mips@fnet.fr
Message-ID: <20001118012850.8rulLYXYbb4pzLRAenDzSw6_dEbanDHkwH-a8phEQXY@z>

Hi,

   The following lines appear in the linuxthreads/sysdeps/mips/pt-machine.h file in version
LinuxThreads 2.1.2:

TODO: This version makes use of MIPS ISA 2 features.  It won't
   work on ISA 1.  These machines will have to take the overhead of
   a sysmips(MIPS_ATOMIC_SET, ...) syscall which isn't implemented
   yet correctly.  There is however a better solution for R3000
   uniprocessor machines possible.

My questions are:
1.  Is the sysmips syscall implemented correctly yet?
2.  What is the better solution for R3000 uniprocessor machines?
3.  Does anyone have a patch for LinuxThreads that supports MIPS ISA 1?

   Thanks and regards,

   Rajesh 
