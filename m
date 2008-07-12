Received: from mo30.po.2iij.net ([210.128.50.53]:40502 "EHLO mo30.po.2iij.net")
	by ftp.linux-mips.org with ESMTP id S20034517AbYGLIrz (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 12 Jul 2008 09:47:55 +0100
Date: Sat, 12 Jul 2008 17:47:41 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
Subject: Re: [PATCH][MIPS] mips_machtype define as one group
Message-ID: <20080712174741.c4dd3149.yoichi_yuasa@tripeaks.co.jp>
In-Reply-To: <20080711143235.GA9016@alpha.franken.de>
References: <20080711225717.cbf55ccc.yoichi_yuasa@tripeaks.co.jp>
	<20080711143235.GA9016@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <yoichi_yuasa@tripeaks.co.jp>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: yoichi_yuasa@tripeaks.co.jp, Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>
Message-ID: <20080712084741.XEj2ixCkUq84Qe_Aguyqt_9wrbgRQR78TSfiiX12chs@z>

On Fri, 11 Jul 2008 16:32:35 +0200
tsbogend@alpha.franken.de (Thomas Bogendoerfer) wrote:

> On Fri, Jul 11, 2008 at 10:57:17PM +0900, Yoichi Yuasa wrote:
> > mips_machtype define as one group.
> 
> wouldn't it make more sense to kill that completly ?

mips_machtype is still used in some places.
Should we check first whether it can be removed?

Yoichi
