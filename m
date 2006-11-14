Received: from localhost.localdomain ([127.0.0.1]:25022 "EHLO
	dl5rb.ham-radio-op.net") by ftp.linux-mips.org with ESMTP
	id S20038654AbWKNNEi (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 14 Nov 2006 13:04:38 +0000
Date: Tue, 14 Nov 2006 13:05:03 +0000
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Portmap on the Encore M3
Message-ID: <20061114130503.GB28579@linux-mips.org>
References: <1163443607.6532.9.camel@sandbar.kenati.com> <20061113233802.GA17130@linux-mips.org> <1163469787.6532.26.camel@sandbar.kenati.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1163469787.6532.26.camel@sandbar.kenati.com>
Return-Path: <ralf@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ashlesha Shintre <ashlesha@kenati.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20061114130503.QEIMyf8RobJKNeakvr5ODbtdk2ibB8sqoG1F8rGN2Qc@z>

On Mon, Nov 13, 2006 at 06:03:07PM -0800, Ashlesha Shintre wrote:

> > > > 16.35 BogoMIPS (lpj=8176)
> > 
> > Sounds about right if your CPU clock hapens to be 8MHz so probably not.
> > Chances the counter was missprogrammed.  Or are you running uncached?
> > Uncached will completly devastate performance.
> > 
> 
> For the AU1500 processor, the CPU Clock is derived from the PLL whose
> input is 12MHz.. Upon reading the value of the SYS_CPUPLL register in
> the calibrate_delay function, I found out that the multiplying factor is
> 40, thus, the CPU Clock frequency is 480MHz.. Thus the lpj should be
> approximately 480000 -- right?
