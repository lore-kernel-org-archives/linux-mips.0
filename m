From: "Gilad Benjamini" <yaelgilad@myrealbox.com>
Subject: Getting Time Difference
Date: Thu, 16 Jan 2003 18:48:09 +0200
Message-ID: <ECEPLLMMNGHMFBLHCLMAGEGDDIAA.yaelgilad@myrealbox.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: 7bit
Return-Path: <yaelgilad@myrealbox.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030116164809.AFd74ZALiZ_u0GzmyhbYtNdawziLhLi5IH0YdalrUfg@z>

Hi,
I am porting code from a x86 platform.
That code uses rdtsc and cpu_khz to compute
the time difference between two events. Jiffies aren't good enough in this 
case.

Looking through header files I can find a few MIPS replacements.
What is the "right" one to use ?

What is the best way to change the code so it can compile
and run on both platforms ?
