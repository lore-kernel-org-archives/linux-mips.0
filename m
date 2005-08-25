From: "Bryan Althouse" <bryan.althouse@3phoenix.com>
Subject: RE: custom ide driver causes "Badness in smp_call_function"
Date: Thu, 25 Aug 2005 17:17:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050825154249.GC2731@linux-mips.org>
Message-ID: <20050825211218Z8225471-3678+7505@linux-mips.org>
Return-Path: <bryan.althouse@3phoenix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20050825211748.P8sgfR2udlzrJH6EDR21v8RUV3_97mRqUNVHikhJPZ0@z>


Here are some observations...  

If I change the line "hwif->irq = 0" in my driver to "hwif->irq = 5", my SMP
kernel no longer experiences SMP badness.  Instead, I get many lines like
"hda: lost interrupt", and the drive is not usable.  If I compile the kernel
without SMP, the drive works properly as before.  I tried irq = 5 because I
noticed that /proc/interrupts indicated that ide0 was being probed at 5.
With the SMP kernel, /proc/interrupts shows a count of 0 for ide0.  My
non-SMP kernel shows a count that increments when the drive is being used
(as expected).

Bryan  
