Received: from mx2.suse.de ([195.135.220.15]:43713 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S27007995AbbLAXY7wDJBD (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 2 Dec 2015 00:24:59 +0100
Date: Wed, 2 Dec 2015 00:24:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v2 1/5] printk/nmi: Generic solution for safe printk in
 NMI
In-Reply-To: <20151127153804.GC2648@pathway.suse.cz>
Message-ID: <alpine.LNX.2.00.1512020022460.32500@pobox.suse.cz>
References: <1448622572-16900-2-git-send-email-pmladek@suse.com> <201511271919.aEZuZKNe%fengguang.wu@intel.com> <20151127153804.GC2648@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <jikos@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Petr Mladek <pmladek@suse.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Daniel Thompson <daniel.thompson@linaro.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, adi-buildroot-devel@lists.sourceforge.net, linux-cris-kernel@axis.com, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, linux-am33-list@redhat.com
Message-ID: <20151201232449.CrvQZCxUiolu6W5vAHtDMP3NWZLpn1AY6qIvHZS8HOg@z>

On Fri, 27 Nov 2015, Petr Mladek wrote:

> MN10300 has its own implementation for entering and exiting NMI 
> handlers. It does not call nmi_enter() and nmi_exit(). Please, find 
> below an updated patch that adds printk_nmi_enter() and 
> printk_nmi_exit() to the custom entry points. Then we could add HAVE_NMI 
> to arch/mn10300/Kconfig and avoid the above warning.

Hmm, so what exactly would go wrong if MN10300 (whatever that architecture 
is) would call nmi_enter() and nmi_exit() at the places where it's 
starting and finishing NMI handler?
