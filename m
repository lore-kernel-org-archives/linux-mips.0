Date: Tue, 15 Jun 2004 20:56:11 -0700
From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] make ps2 mouse work ...
Message-ID: <20040615205611.1e9cbfcc.akpm@osdl.org>
In-Reply-To: <20040615191023.G28403@mvista.com>
References: <20040615191023.G28403@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <akpm@osdl.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Jun Sun <jsun@mvista.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20040616035611.WzIaBhyAy09SljcTWxBy2WdTZG4eQI1vKA0iW49I74M@z>

Jun Sun <jsun@mvista.com> wrote:
>
> 
> I found this problem on a MIPS machine.  The problem is 
> likely to happen on other register-rich RISC arches too.
> 
> cmdcnt needs to be volatile since it is modified by
> irq routine and read by normal process context.

volatile is not the preferred way to fix this up.  This points at either a
locking error in the psmouse driver or a missing "memory" thingy in the
mips port somewhere.

Please describe the bug which led to this patch.  Where was it getting stuck?
