Received: from relay1.mentorg.com ([192.94.38.131]:33699 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6862060AbaFQPD1Rnoqw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 17 Jun 2014 17:03:27 +0200
Date: Tue, 17 Jun 2014 15:03:15 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: MIPS MSA sigcontext changes in 3.15
Message-ID: <Pine.LNX.4.64.1406171447030.23412@digraph.polyomino.org.uk>
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
Message-ID: <20140617150315.jxcLt-o4lIcKW_De3rfapheKtWHIm2iRZOUdukeINdw@z>

Reviewing changes in Linux 3.15 for anything for which glibc changes would 
be appropriate, I don't see how the MSA sigcontext changes are supposed to 
work with existing binaries.

The sigcontext structure isn't used on its own - it's part of ucontext, 
which is passed to signal handlers, and it's not at the end of ucontext, 
but followed by the signal mask.  So existing binaries will expect the 
signal mask at a particular offset in the ucontext.  As far as I can see, 
extending sigcontext requires a new sigaction flag that could be used to 
opt in, for a particular signal handler, to receiving the new-layout 
ucontext (so new symbol versions of sigaction in glibc could then pass 
that flag to the kernel, but existing binaries would continue to get 
old-layout ucontext from the kernel), or else putting the new data at the 
end of ucontext rather than in the main sigcontext structure (though I 
don't know if that would have other issues).

-- 
Joseph S. Myers
joseph@codesourcery.com
