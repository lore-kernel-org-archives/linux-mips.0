Received: from relay1.mentorg.com ([192.94.38.131]:38088 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6862607AbaFQPoqLZxKn (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Jun 2014 17:44:46 +0200
Date: Tue, 17 Jun 2014 15:44:36 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: Re: MIPS MSA sigcontext changes in 3.15
In-Reply-To: <Pine.LNX.4.64.1406171447030.23412@digraph.polyomino.org.uk>
Message-ID: <Pine.LNX.4.64.1406171539240.23412@digraph.polyomino.org.uk>
References: <Pine.LNX.4.64.1406171447030.23412@digraph.polyomino.org.uk>
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
To: linux-mips@linux-mips.org, libc-alpha@sourceware.org, linux-api@vger.kernel.org
Message-ID: <20140617154436.Sz1VtYgiDhTrG2E7WBqQ8ENdzA22bB4XzrV2rEiIw0I@z>

On Tue, 17 Jun 2014, Joseph S. Myers wrote:

> signal mask at a particular offset in the ucontext.  As far as I can see, 
> extending sigcontext requires a new sigaction flag that could be used to 
> opt in, for a particular signal handler, to receiving the new-layout 
> ucontext (so new symbol versions of sigaction in glibc could then pass 
> that flag to the kernel, but existing binaries would continue to get 
> old-layout ucontext from the kernel), or else putting the new data at the 

And a new flag would itself be problematic - signal handlers would need 
wrapping with userspace code to convert structure layout when new-version 
sigaction is used on an older kernel.  That suggests putting the new data 
at the end of ucontext is to be preferred (but in any case it would be 
best to revert the incompatible changes until something compatible with 
existing userspace can be produced).

-- 
Joseph S. Myers
joseph@codesourcery.com
