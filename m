Received: from smtp.zeugmasystems.com ([70.79.96.174]:15783 "EHLO
	zeugmasystems.com" rhost-flags-OK-OK-OK-FAIL) by ftp.linux-mips.org
	with ESMTP id S1493511AbZIYXLg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 26 Sep 2009 01:11:36 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Strange bad accesses in compat_exit_robust_list (2.6.26, n32 ABI).
Date: Fri, 25 Sep 2009 16:11:30 -0700
Message-ID: <DDFD17CC94A9BD49A82147DDF7D545C501F7053F@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <KKylheku@zeugmasystems.com>
Return-Path: <KKylheku@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20090925231130.Xf5lVx4OjxMfJuZ1UttJd8yeWR3HFm0raBRpplSEx7w@z>

Kaz Kylheku wrote:
> Hi all,
> 
> We made a strange discovery some time ago. After adding some tracing
> printk's to the compat_exit_robust_list function for all the cases
> where fetching the
> robust entry fails, we discovered that, from time to time,
> it's being reported
> for processes that don't even use threads.

Hmm. Maybe a syscall is being misrouted? Perhaps user space is calling
some function that ends up routed to the compat_set_robust_list
entry in the syscall table, causing a junk value to be installed
as the robust list. Hmm. But robust mutexes work on our platform;
so glibc does reach the right syscalls when they are intended.
