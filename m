Received: from [81.2.110.250] ([81.2.110.250]:17373 "EHLO lxorguk.ukuu.org.uk")
	by ftp.linux-mips.org with ESMTP id S23796355AbYKTUCp (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 20 Nov 2008 20:02:45 +0000
Date: Thu, 20 Nov 2008 20:02:12 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 20/26] 8250: Serial driver changes to support future
 Cavium OCTEON serial patches.
Message-ID: <20081120200212.17e67add@lxorguk.ukuu.org.uk>
In-Reply-To: <1227047057-4911-2-git-send-email-ddaney@caviumnetworks.com>
References: <49233FDE.3010404@caviumnetworks.com>
	<1227047057-4911-2-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <alan@lxorguk.ukuu.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, linux-serial@vger.kernel.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Tomaso Paoletti <tpaoletti@caviumnetworks.com>
Message-ID: <20081120200212.KS-2fQgUa5FWvNHtpjuvLOHrNQm_PJct7MWxZLC-AL0@z>

On Tue, 18 Nov 2008 14:24:14 -0800
David Daney <ddaney@caviumnetworks.com> wrote:

> In order to use Cavium OCTEON specific serial i/o drivers, we first
> patch the 8250 driver to use replaceable I/O functions.  Compatible
> I/O functions are added for existing iotypeS.
> 
> An added benefit of this change is that it makes it easy to factor
> some of the existing special cases out to board/SOC specific support
> code.
> 
> The alternative is to load up 8250.c with a bunch of OCTEON specific
> iotype code and bug work-arounds.

Neither are pretty but this looks the better option I agree. Only niggle
is the use of "_fn" - Linux generally doesn't put types into variable
names.
