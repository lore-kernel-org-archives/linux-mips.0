Received: from pandora.arm.linux.org.uk ([78.32.30.218]:35584 "EHLO
        pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27007367AbbBZXBHCq1Qh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Feb 2015 00:01:07 +0100
Date: Thu, 26 Feb 2015 23:00:52 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] Fix offset2lib issue for x86*, ARM*, PowerPC and MIPS
Message-ID: <20150226230052.GN8656@n2100.arm.linux.org.uk>
References: <54EB735F.5030207@upv.es>
 <CAGXu5j+SBRcj+BGyxEwUzgKsB2fdzNiPY37Q=JTsf=-QbGwoGA@mail.gmail.com>
 <20150223205436.15133mg1kpyojyik@webmail.upv.es>
 <20150224073906.GA16422@gmail.com>
 <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150226143815.09386fe280c7bd8797048bb2@linux-foundation.org>
Return-Path: <linux+linux-mips=linux-mips.org@arm.linux.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Kees Cook <keescook@chromium.org>, "x86@kernel.org" <x86@kernel.org>, Hector Marco Gisbert <hecmargi@upv.es>, LKML <linux-kernel@vger.kernel.org>, ismael Ripoll <iripoll@upv.es>, linuxppc-dev@lists.ozlabs.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150226230052.rWTAlqqqgABpvM04sotE41KeL2GF4oUVqbGiA9XjKB0@z>

On Thu, Feb 26, 2015 at 02:38:15PM -0800, Andrew Morton wrote:
> diff -puN arch/arm64/Kconfig~fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix arch/arm64/Kconfig
> --- a/arch/arm64/Kconfig~fix-offset2lib-issue-for-x86-arm-powerpc-and-mips-fix
> +++ a/arch/arm64/Kconfig
> @@ -1,4 +1,4 @@
> -config ARM64
> +qconfig ARM64

Is this a typo?

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
