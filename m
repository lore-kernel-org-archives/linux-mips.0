Received: from smtp3.infineon.com ([203.126.106.229]:39448 "EHLO
	smtp3.infineon.com") by ftp.linux-mips.org with ESMTP
	id S20024851AbXKDL1X convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 4 Nov 2007 11:27:23 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Get stuck in wake_up_process(rq->migration_thread);
Date: Sun, 4 Nov 2007 19:26:12 +0800
Message-ID: <31E09F73562D7A4D82119D7F6C17298602B11510@sinse303.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
Return-Path: <KokHow.Teh@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20071104112612.46bIzmuPz0aGUSQukpgP7bjHTPhVCHB_0lp6DBJ4ZVs@z>

Hi;
	I have a linux-2.6.20 kernel configured with CONFIG_MIPS_MT_SMP
(SMVPE) running on a MIPS34KC processor emulation platform. Everything
goes fine until the scheduler gets stuck in trying to wake up the
migration thread. I configured the kernel with max_cache_size=2097152,
having no idea of what the variable is all about. Putting debug messages
in kernel/sched.c tells me that the the migration_thread() routine has
gone to sleep calling schedul() function and set_cpus_allowed() function
gets stuck in wake_up_process(rq->migration_thread); 
	Any insight is appreciated.

Regards.
KH
