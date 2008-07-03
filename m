Received: from wf-out-1314.google.com ([209.85.200.174]:28023 "EHLO
	wf-out-1314.google.com") by ftp.linux-mips.org with ESMTP
	id S20130425AbYGCOun (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Thu, 3 Jul 2008 15:50:43 +0100
Received: by wf-out-1314.google.com with SMTP id 27so926140wfd.21
        for <linux-mips@linux-mips.org>; Thu, 03 Jul 2008 07:50:40 -0700 (PDT)
Message-ID: <19f34abd0807030750n31a3bc3t8609f58c9c1f7c7@mail.gmail.com>
Date: Thu, 3 Jul 2008 16:50:40 +0200
From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: kernel configuration_ help
In-Reply-To: <1214997772.16081.3.camel@teclever-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1214997772.16081.3.camel@teclever-desktop>
Return-Path: <vegard.nossum@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: saravanakumar <saravanakumar.s@teclever.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20080703145040.JHbLBctkOoltOpjDVU1BjE0BbEAFrEIdjkIrjIGWNKg@z>

On Wed, Jul 2, 2008 at 1:22 PM, saravanakumar
<saravanakumar.s@teclever.com> wrote:
> hai,
> i want my usb to access the root file system,for that what are the
> changes to be done in kernel code, and  in the configuration, i think
> changes to be done in do_mount.c for root delay, if its correct where to
> give the delay.

Hi,

If I understand correctly, you have your root filesystem on a USB
device. It seems that you must pass the rootdelay= option on the
kernel command line. No changes to the code should be necessary.
