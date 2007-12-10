Received: from h155.mvista.com ([63.81.120.155]:61635 "EHLO imap.sh.mvista.com")
	by ftp.linux-mips.org with ESMTP id S20025092AbXLJRrq (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 10 Dec 2007 17:47:46 +0000
Message-ID: <475D7BD4.1050505@ru.mvista.com>
Date: Mon, 10 Dec 2007 20:48:04 +0300
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Alchemy: fix PCI resource conflict (take 2)
References: <200712102028.51448.sshtylyov@ru.mvista.com> <BLU127-W1655DCD5A946AF12DE533E8A6B0@phx.gbl>
In-Reply-To: <BLU127-W1655DCD5A946AF12DE533E8A6B0@phx.gbl>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <sshtylyov@ru.mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Nathan Eggan <nathan_eggan@live.com>
Cc: linux-mips mailing list <linux-mips@linux-mips.org>

Nathan Eggan wrote:

> Any chance this will help fix my Au1x00 serial + USB issues?

    I don't think so.

> I know the old PCI bus code used to not work with the USB - at least the two could not run together.

    There are some chip errata connected with USB and PCI...

WBR, Sergei
