Received: from relay1.mentorg.com ([192.94.38.131]:52605 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6824820Ab3KEBE52xdep (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Nov 2013 02:04:57 +0100
Date: Tue, 5 Nov 2013 01:04:45 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: Re: prlimit64: inconsistencies between kernel and userland
In-Reply-To: <20131104.194519.1657797548878784116.davem@davemloft.net>
Message-ID: <Pine.LNX.4.64.1311050058580.9883@digraph.polyomino.org.uk>
References: <20130628133835.GA21839@hall.aurel32.net> <20131104213756.GD18700@hall.aurel32.net>
 <20131104.194519.1657797548878784116.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <joseph_myers@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Miller <davem@davemloft.net>
Cc: aurelien@aurel32.net, linux-mips@linux-mips.org, libc-alpha@sourceware.org
Message-ID: <20131105010445.YhW0FH6Z9qgdkHkUXKK9_PaKJ3Ef8GkM71ru7I2Lc8E@z>

On Mon, 4 Nov 2013, David Miller wrote:

> From: Aurelien Jarno <aurelien@aurel32.net>
> Date: Mon, 4 Nov 2013 22:37:56 +0100
> 
> > Any news about this issue? It really starts to causes a lot of issues in
> > Debian. I have added a Cc: to libc people so that we can also hear their
> > opinion.
> 
> I had the same exact problem on sparc several years ago, I simply fixed
> the glibc header value, it's the only way to fix this.
> 
> Yes, that means you then have to recompile applications and libraries
> that reference this value.

Surely you can create new symbol versions for getrlimit64 and setrlimit64, 
with the old versions just using the 32-bit syscalls (or otherwise 
translating between conventions, but using the 32-bit syscalls is the 
simplest approach)?  I see no need to break compatibility with existing 
binaries.

As I noted in 
<https://sourceware.org/ml/libc-ports/2006-05/msg00020.html>, at that time 
the value of RLIM64_INFINITY for o32/n32 was purely a glibc convention the 
kernel didn't see at all.  It's only with the use of newer syscalls that 
this glibc convention is any sort of problem.

-- 
Joseph S. Myers
joseph@codesourcery.com
