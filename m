Message-ID: <06c701c183f7$d23eb410$5601010a@prefect>
From: "Bradley D. LaRonde" <brad@ltc.com>
References: <20011213163953.GB23023@paradigm.rfc822.org>
Subject: Re: [PATCH] /proc/cpuinfo endianess (autoconf dependencie)
Date: Thu, 13 Dec 2001 12:01:34 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Florian Lohoff <flo@rfc822.org>, linux-mips@oss.sgi.com
Message-ID: <20011213170134.06vbaHx8JJ4ymDB7WscVb9kE8H5ptPtxKfts7yRCG7M@z>

For autoconf?  Why need to ask the kernel?  Aren't there other very simple
ways of determining build endianness in userspace?

Regards,
Brad

----- Original Message -----
From: "Florian Lohoff" <flo@rfc822.org>
To: <linux-mips@oss.sgi.com>
Sent: Thursday, December 13, 2001 11:39 AM
Subject: [PATCH] /proc/cpuinfo endianess (autoconf dependencie)

Something like this should be needed for current kernel to make
autoconf happy ...

--- arch/mips/kernel/proc.c 2001/12/12 13:45:58 1.27.2.3
+++ arch/mips/kernel/proc.c 2001/12/13 17:39:19
@@ -51,6 +51,11 @@
  seq_printf(m, "BogoMIPS\t\t: %lu.%02lu\n",
                loops_per_jiffy / (500000/HZ),
                (loops_per_jiffy / (5000/HZ)) % 100);
+#ifdef __MIBSEB__
+ seq_printf(m, "byteorder\t\t: big endian\n");
+#else
+ seq_printf(m, "byteorder\t\t: little endian\n");
+#endif
  seq_printf(m, "wait instruction\t: %s\n", cpu_wait ? "yes" : "no");
  seq_printf(m, "microsecond timers\t: %s\n",
                (mips_cpu.options & MIPS_CPU_COUNTER) ? "yes" : "no");
