Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: [patch] arch/mips/au1000/common/time.c
Date: Fri, 18 Mar 2005 17:13:12 -0800
Message-ID: <BBB228F72FF00E4390479AC295FF4B350DE933@FOOTHILL.iad.idealab.com>
From: "Joseph Chiu" <joseph@omnilux.net>
Return-Path: <joseph@omnilux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, "Ralf Baechle (E-mail)" <ralf@linux-mips.org>
Message-ID: <20050319011312.iJ8oSpU_YdrvBVKlK7bBMm1ZwkiIM29hA75e31AjfyU@z>

Hi,

I reported on this a few years ago on 2.4.18, but it never seemed to have been addressed...

in linux/arch/mips/au1000/common/time.c, mips_timer_interrupt calls irq_enter() *before*
checking if (r4k_offset == 0), and then exits the interrupt without calling irq_exit().

This problem was crashing our boards in some test cases...  Please apply.

Thanks,
Joseph

----

RCS file: /mnt/cvs/kernel-2.6/arch/mips/au1000/common/time.c,v
retrieving revision 1.1.1.1
diff -c -r1.1.1.1 time.c
*** time.c	13 Mar 2005 08:19:05 -0000	1.1.1.1
--- time.c	19 Mar 2005 01:04:19 -0000
***************
*** 86,96 ****
  	int irq = 63;
  	unsigned long count;
  
- 	irq_enter();
- 	kstat_this_cpu.irqs[irq]++;
- 
  	if (r4k_offset == 0)
  		goto null;
  
  	do {
  		count = read_c0_count();
--- 86,96 ----
  	int irq = 63;
  	unsigned long count;
  
  	if (r4k_offset == 0)
  		goto null;
+ 
+ 	irq_enter();
+ 	kstat_this_cpu.irqs[irq]++;
  
  	do {
  		count = read_c0_count();
