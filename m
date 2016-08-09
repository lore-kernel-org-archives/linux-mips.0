Received: from mail.linuxfoundation.org ([140.211.169.12]:57218 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992398AbcHIV5dnk0XF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 9 Aug 2016 23:57:33 +0200
Date: Tue, 9 Aug 2016 14:57:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] console: Don't prefer first registered if DT
 specifies stdout-path
Message-ID: <20160809145726.1f9f5e5752c94b3113d77674@linux-foundation.org>
In-Reply-To: <20160809151937.26118-1-paul.burton@imgtec.com>
References: <20160809125010.14150-1-paul.burton@imgtec.com>
        <20160809151937.26118-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <akpm@linux-foundation.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Tejun Heo <tj@kernel.org>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jiri Slaby <jslaby@suse.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>, Ivan Delalande <colona@arista.com>, Thierry Reding <treding@nvidia.com>, Borislav Petkov <bp@suse.de>, Jan Kara <jack@suse.com>, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Message-ID: <20160809215726.S0AL8sV-eFZTGBF-eYVbU6D_UvIV87OiBy2Xyld_8X8@z>

On Tue, 9 Aug 2016 16:19:37 +0100 Paul Burton <paul.burton@imgtec.com> wrote:

> If a device tree specifies a preferred device for kernel console output
> via the stdout-path or linux,stdout-path chosen node properties or the
> stdout alias then the kernel ought to honor it & output the kernel
> console to that device. As it stands, this isn't the case. Whilst we
> parse the stdout-path properties & set an of_stdout variable from
> of_alias_scan(), and use that from of_console_check() to determine
> whether to add a console device as a preferred console whilst
> registering it, we also prefer the first registered console if no other
> has been selected at the time of its registration.
> 
> This means that if a console other than the one the device tree selects
> via stdout-path is registered first, we will switch to using it & when
> the stdout-path console is later registered the call to
> add_preferred_console() via of_console_check() is too late to do
> anything useful. In practice this seems to mean that we switch to the
> dummy console device fairly early & see no further console output:
> 
>     Console: colour dummy device 80x25
>     console [tty0] enabled
>     bootconsole [ns16550a0] disabled
> 
> Fix this by not automatically preferring the first registered console if
> one is specified by the device tree. This allows consoles to be
> registered but not enabled, and once the driver for the console selected
> by stdout-path calls of_console_check() the driver will be added to the
> list of preferred consoles before any other console has been enabled.
> When that console is then registered via register_console() it will be
> enabled as expected.

Looks reasonable.  Could you please do `grep -r stdout-path
Documentation' and check that everything therein is complete, accurate
and necessary?
