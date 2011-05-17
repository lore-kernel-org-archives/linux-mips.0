Received: from tundra.namei.org ([65.99.196.166]:47533 "EHLO tundra.namei.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491069Ab1EQNaa (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 17 May 2011 15:30:30 +0200
Date: Tue, 17 May 2011 23:29:36 +1000 (EST)
From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH 3/5] v2 seccomp_filters: Enable ftrace-based system call
 filtering
In-Reply-To: <20110517131058.GE21441@elte.hu>
Message-ID: <alpine.LRH.2.00.1105172317060.5404@tundra.namei.org>
References: <1304017638.18763.205.camel@gandalf.stny.rr.com> <1305169376-2363-1-git-send-email-wad@chromium.org> <20110512074850.GA9937@elte.hu> <alpine.LRH.2.00.1105122133500.31507@tundra.namei.org> <20110512130104.GA2912@elte.hu>
 <alpine.LRH.2.00.1105131018040.3047@tundra.namei.org> <20110513121034.GG21022@elte.hu> <alpine.LRH.2.00.1105161006340.21749@tundra.namei.org> <20110516150837.GA513@elte.hu> <alpine.LRH.2.00.1105171214330.31710@tundra.namei.org>
 <20110517131058.GE21441@elte.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-Path: <jmorris@namei.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Frederic Weisbecker <fweisbec@gmail.com>, Eric Paris <eparis@redhat.com>, kees.cook@canonical.com, agl@chromium.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, "Serge E. Hallyn" <serge@hallyn.com>, Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Michal Marek <mmarek@suse.cz>, Oleg Nesterov <oleg@redhat.com>, Jiri Slaby <jslaby@suse.cz>, Russell King <linux@arm.linux.org.uk>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, Paul Mundt <lethal@linux-sh.org>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20110517132936.culd69K7TzCf1MmYU4Tjv37g44WWIg5sz13ppI_gex0@z>

On Tue, 17 May 2011, Ingo Molnar wrote:

> I'm not sure i get your point.

Your example was not complete as described.  After an apparently simple 
specification, you've since added several qualifiers and assumptions, and 
I still doubt that it's complete.

A higher level goal would look like

"Allow a sandbox app access only to approved resources, to contain the 
effects of flaws in the app", or similar.

Note that this includes a threat model (remote attacker taking control of 
the app) and a general and fully stated strategy for dealing with it.
