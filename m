Received: (root@lappi.linux-mips.net) by lappi.linux-mips.net
	id S1101541AbYCZMju (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 26 Mar 2008 13:39:50 +0100
Resent-Message-ID: <20080326123949.GB2581@lappi.linux-mips.net>
Resent-To: linux-mips@linux-mips.org
Received: from oss.sgi.com ([192.48.170.157]:2776 "EHLO oss.sgi.com")
	by lappi.linux-mips.net with ESMTP id S1101183AbYCZMOO (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 26 Mar 2008 13:14:14 +0100
Received: from p549F5321.dip.t-dialin.net (localhost [127.0.0.1])
	by oss.sgi.com (8.12.11.20060308/8.12.11/SuSE Linux 0.7) with ESMTP id m2QBVUpk016060
	for <linux-mips@linux-mips.org>; Wed, 26 Mar 2008 05:13:33 -0700
Received: from relay01.mx.bawue.net ([193.7.176.67]:6878 "EHLO
	relay01.mx.bawue.net") by lappi.linux-mips.net with ESMTP
	id S1101594AbYCYRNC (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 25 Mar 2008 18:13:02 +0100
Date: Tue, 25 Mar 2008 17:12:29 +0000
From: Thiemo Seufer <ths@networkno.de>
Subject: Re: SB1250 locking up in init on current 2.6.16 kernel
Message-ID: <20080325171228.GD15685@networkno.de>
References: <15031.81072.qm@web38802.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15031.81072.qm@web38802.mail.mud.yahoo.com>
Return-Path: <root@linux-mips.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Larry Stefani <lstefani@yahoo.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20080325171229.WZ7ULQvirCVJ-TkZRfLQyqsrtIjb29wHkQXoafKua2w@z>

Larry Stefani wrote:
> Hi,
> 
> I've been trying to upgrade from 2.6.16.18 to
> 2.6.16.60, but am seeing a hard lockup right before
> "INIT: version 2.78 booting" on my SB1250-based board.
> 
> I found a related discussion on the Debian mailing
> list:
> 
> http://groups.google.com/group/linux.debian.bugs.dist/browse_thread/thread/b7159ee25106c7f9
> 
> However, after applying Thiemo's patch to mark pages
> tainted by PIO IDE as dirty, the lockup still occurs.
> 
> I narrowed the file changes to
> 
>      arch/mips/mm/c-sb1.c
>      arch/mips/mm/cache.c
>      arch/mips/mm/init.c
>      include/asm-mips/cache-flush.h
>      include/asm-mips/page.h
> 
> between 2.6.16.27 and 2.6.16.29.  There was no
> 2.6.16.28 tarball posted on linux-mips.org, so I
> basically brought .27 to .29 until I found the
> offending files.

Please learn about git bisect (git-bisect start; git-bisect good;
git-bisect bad) and use it to isolate the offending commit.


Thiemo
