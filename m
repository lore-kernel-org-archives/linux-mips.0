Received: from mail.zeugmasystems.com ([192.139.122.66]:41821 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20025385AbYG2AjK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 29 Jul 2008 01:39:10 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Committed_AS showing erroneous value
Date: Mon, 28 Jul 2008 17:38:54 -0700
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C5FC8141@exchange.ZeugmaSystems.local>
From: "Anirban Sinha" <ASinha@zeugmasystems.com>
Return-Path: <ASinha@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20080729003854.9bOY0IJu_8iqOpljppg4nVxCB_AwHOqRRDBhlX7vuaY@z>

Hi:

On our mips hardware, we see an unusual issue with the /proc/meminfo
stats. We do disable memory over commit and do not configure swap. We
are observing that the Committed_AS value is smaller than the amount of
used resident memory. For example:

root:1@13.Zeugma:~# cat /proc/meminfo
MemTotal:       965168 kB
MemFree:        920108 kB
...
CommitLimit:    965168 kB
Committed_AS:     5540 kB
...

Amount of memory used is: 965168-920108 = 44 Megs. However, committed
memory is just 5 megs. This is wrong. Does anybody else get a similar
error? Our 64 bit kernel version is 2.6.17.7 on which we run 32 bit apps
(n32 ABI).

Thanks to anyone who can throw some lights.

Ani
