Received: from fnoeppeil48.netpark.at ([217.175.205.176]:28138 "EHLO
	roarinelk.homelinux.net") by ftp.linux-mips.org with ESMTP
	id S20022895AbYESKHz (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 19 May 2008 11:07:55 +0100
Date: Mon, 19 May 2008 12:07:52 +0200
From: Manuel Lauss <mano@roarinelk.homelinux.net>
Subject: Re: [PATCH 3/9] au1xmmc: remove pb1200 board-specific code from
	driver file
Message-ID: <20080519100752.GA22970@roarinelk.homelinux.net>
References: <20080519080339.GA21985@roarinelk.homelinux.net> <20080519080533.GD21985@roarinelk.homelinux.net> <20080519081700.GA22270@roarinelk.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080519081700.GA22270@roarinelk.homelinux.net>
Return-Path: <mano@roarinelk.homelinux.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, drzeus@drzeus.cx, sshtylyov@ru.mvista.com
Message-ID: <20080519100752.DQWJyK3dxBJk1AtywHsNBh1sMr1MkxF8TqZb04T0-q0@z>

On Mon, May 19, 2008 at 10:17:00AM +0200, Manuel Lauss wrote:
> Theres a tiny bug in the previous patch, please use this one here.

I found yet another bug which resulted in DMA being turned off
after the very first request finished.  Fixed version below.

Thanks,
	Manuel Lauss

--- 
