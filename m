Received: (root@lappi.linux-mips.net) by lappi.linux-mips.net
	id S1100670AbYCZMiY (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 26 Mar 2008 13:38:24 +0100
Resent-Message-ID: <20080326123823.GA2581@lappi.linux-mips.net>
Resent-To: linux-mips@linux-mips.org
Received: from oss.sgi.com ([192.48.170.157]:64171 "EHLO oss.sgi.com")
	by lappi.linux-mips.net with ESMTP id S1096320AbYCZLhr (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 26 Mar 2008 12:37:47 +0100
Received: from p549F5321.dip.t-dialin.net (localhost [127.0.0.1])
	by oss.sgi.com (8.12.11.20060308/8.12.11/SuSE Linux 0.7) with ESMTP id m2QBVUZi016060
	for <linux-mips@linux-mips.org>; Wed, 26 Mar 2008 04:37:07 -0700
Received: from web38815.mail.mud.yahoo.com ([209.191.125.106]:52659 "HELO
	web38815.mail.mud.yahoo.com") by lappi.linux-mips.net with SMTP
	id S1101128AbYCYNFi (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 25 Mar 2008 14:05:38 +0100
Date: Tue, 25 Mar 2008 06:05:35 -0700 (PDT)
From: Larry Stefani <lstefani@yahoo.com>
Subject: Re: SB1250 locking up in init on current 2.6.16 kernel
In-Reply-To: <20080324203311.GB15294@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Message-ID: <64859.43533.qm@web38815.mail.mud.yahoo.com>
Return-Path: <root@linux-mips.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org

Hello Ralf,

Thank you very much for the quick response.  I know
you must be terribly busy with the server move, so I
won't take up too much more of your time.

I did find an old (possibly related) discussion you
were involved in:

http://www.linux-mips.org/archives/linux-mips/2006-09/msg00194.html

I can't tell from the thread whether it was a problem
seen on 2.6.16.29, but that might have been tip at the
time.

> It's a bug which should be fixed but nevertheless I
> can highly recommend
> something like a SiliconImage SATA controller - the
> onboard PIO PATA
> controller is so slow.

I understand, but changing that is not an option for
me today.

> I've pushed the tag again so now there is a tarball.

Thanks.  I thought something was terribly wrong with
.28 for it to be skipped.  

> If you need to track something like this you're
> probably best with
> git bisect which should bring you right to the
> offending commit.

I probably should have used that approach instead of
diffing .27 and .29 and narrowing the file list by
hand.  As it was, there were changes to non-MIPS
platforms and devices I'm not using so those were easy
to apply to .27.  Also, there were many file changes
for MT SMP support, and *most* (but not all) of those
changes were wrapped with conditional compiles, so
those were also easy to apply.  I knew once I got to
these five files I was in some interesting code that
could point to the problems I'm seeing.

> Later kernels do run on bcm1480 which is close
> enough.

By "later kernels", do you mean 2.6.16.60 or different
kernel branches?

Perhaps, but I'm seeing identical failures in .29 and
.60, although that could be misleading.  I do see
significant SMP-related changes in c-sb1.c between .29
and .60, and I am running in SMP.  I wish there was an
easy way to know whether it's in the same code.

Anyway, in the interest of time I may revert to .27
which appears to work.  I don't need any of the MT SMP
related changes that followed, and perhaps I can live
without the enhancements between .27 and .60 for now.

Thanks,
Larry Stefani
lstefani@yahoo.com



      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
