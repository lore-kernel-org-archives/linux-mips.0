Received: from smtp101.biz.mail.re2.yahoo.com ([68.142.229.215]:8557 "HELO
	smtp101.biz.mail.re2.yahoo.com") by ftp.linux-mips.org with SMTP
	id S8133579AbVJQQd2 (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 17 Oct 2005 17:33:28 +0100
In-Reply-To: <00b201c5d32e$2de780b0$0302a8c0@Ulysses>
References: <f69849430510170429t2735ed0fo3caa862c1dfea83a@mail.gmail.com> <43539ADF.6040504@gentoo.org> <00b201c5d32e$2de780b0$0302a8c0@Ulysses>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-ID: <3888b5a785ca8313b05d10eec9871fe6@embeddedalley.com>
Content-Transfer-Encoding: 7bit
From: Dan Malek <dan@embeddedalley.com>
Subject: Re: How to improve performance of 2.6 kernel
Date: Mon, 17 Oct 2005 12:38:34 -0400
Return-Path: <dan@embeddedalley.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <KevinK@mips.com>
Cc: kernel coder <lhrkernelcoder@gmail.com>, linux-mips@linux-mips.org, Stuart Longland <redhatter@gentoo.org>
Message-ID: <20051017163834.k_dXlvB8S5a9QcZZEB6nRZ8QFUAeK8xCli1hdSLOyok@z>


On Oct 17, 2005, at 11:19 AM, Kevin D. Kissell wrote:

> If this can't be explained by a configuration error, we have a real
> problem here, but if that's the case, I'm surprised no one has raised
> a red flag earlier.

It has been discussed on other processor architecture lists.
It's been hard to justify the move from 2.4 to 2.6 on resource
challenged embedded systems, which unfortunately make up the
majority of systems running Linux.  There are various processor
specific modifications (mostly around VM, MMU, and cache
management) being attempted to bring the performance level
back up to 2.4.  If these were back ported to 2.4, I suspect the
performance difference would be even greater.

Of course, the speed and resources of workstations masks
the problems, so most developers don't "feel" the system is
any different. There isn't interest in the detailed performance
measurements we have to do on embedded systems when
we do an upgrade and realize it doesn't meet the performance
goals.  This is usually just written off with the "....  well, you have
new features .." statement, but somehow it doesn't add up.

There isn't any magic configuration option or quick fix.  You
have to take the time to dig into the details of a specific
performance issue and then try to optimize anything you can
to improve the situation.

Thanks.

	-- Dan
