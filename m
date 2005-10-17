Received: from 209-232-97-206.ded.pacbell.net ([209.232.97.206]:16821 "EHLO
	dns0.mips.com") by ftp.linux-mips.org with ESMTP id S8133578AbVJQP0z
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 17 Oct 2005 16:26:55 +0100
Message-ID: <00b201c5d32e$2de780b0$0302a8c0@Ulysses>
From: "Kevin D. Kissell" <KevinK@mips.com>
References: <f69849430510170429t2735ed0fo3caa862c1dfea83a@mail.gmail.com> <43539ADF.6040504@gentoo.org>
Subject: Re: How to improve performance of 2.6 kernel
Date: Mon, 17 Oct 2005 17:19:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <KevinK@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Stuart Longland <redhatter@gentoo.org>, kernel coder <lhrkernelcoder@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20051017151931.C18ZJOPfCwTkV8eBZILyggWol_enTPYijoy7tk2V7hc@z>

>kernel coder wrote:
>> I am also attaching the benchmarks I took for both the kernels. Is
>> there any way I can improve 2.6's performance? Thanks.
>
>Hi,
> Don't mean to nitpick... but do you think it wise to use a proprietry
>format like Microsoft Excel on a prodominantly Linux-user list? :-)
>Tab-delimited would probably be better for distribution on a mailing list.

There are 2D data plots that are hard to do as ASCII art. ;o)
It opened fine for me in Open Office - there was one set of graphs
that looked to be empty, but I couldn't tell if that was OO screwing
up or the way the spreadsheet went out.  But the raw data was
legible and troubling.

> How much slower are we talking here?  And in what regards?

Memory copy, network I/O, and disk I/O, by factors ranging from
about 10% to almost 50% - I'd say about 25% on the average.
If this can't be explained by a configuration error, we have a real
problem here, but if that's the case, I'm surprised no one has raised
a red flag earlier.

        Regards,

        Kevin K.
