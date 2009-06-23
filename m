Received: from smtp.zeugmasystems.com ([70.79.96.174]:24477 "EHLO
	zeugmasystems.com" rhost-flags-OK-OK-OK-FAIL) by ftp.linux-mips.org
	with ESMTP id S1492439AbZFWVs6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 23 Jun 2009 23:48:58 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Silly 100% CPU behavior on a SIG_IGN-ored SIGBUS.
Date: Tue, 23 Jun 2009 14:45:34 -0700
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C501C35128@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <KKylheku@zeugmasystems.com>
Return-Path: <KKylheku@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20090623214534.5hwJRNdEA45ZeJqqw_xb7kAv83A48Xns9sKSC1hXtVs@z>

Hi all,

On kernel 2.6.26, glibc 2.5 (n32), SiByte SB-1 core, the following
program goes into 100% CPU, chewing up about 80% kernel time and
20% user.

#include <stdio.h>
#include <signal.h>

int main(void)
{
  int *deadbeef = (int *) 0xdeadbeef;
  signal(SIGBUS, SIG_IGN);
  printf("*deadbeef == %d\n", *deadbeef);
  return 0;
}

If any fatal exception is ignored, the program should be killed
if that exception happens. 100% CPU is not a useful response.

(If there is a handler, and that handler returns without doing anything
to
prevent a recurrence of the exception when the instruction is re-tried,
that's different).
