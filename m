Received: from ozlabs.org ([203.10.76.45]:55706 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1903544Ab2HNAXH (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 14 Aug 2012 02:23:07 +0200
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] MIPS: fix module.c build for 32 bit
In-Reply-To: <31154.1344872382@warthog.procyon.org.uk>
References: <1344332473-19842-1-git-send-email-jonas.gorski@gmail.com> <31154.1344872382@warthog.procyon.org.uk>
Date: Tue, 14 Aug 2012 09:42:31 +0930
Message-ID: <87d32us55c.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
Return-Path: <linux-mips-bounce@linux-mips.org>
To: David Howells <dhowells@redhat.com>
Cc: Jonas Gorski <jonas.gorski@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20120814001231.i2aGMRFjP6bRshtZ0CUzSQyqUWHrzGcDcrjlYyWo9T4@z>

On Mon, 13 Aug 2012 16:39:42 +0100, David Howells <dhowells@redhat.com> wrote:
> 
> Hi Rusty,
> 
> I've fixed up my patch for ARM and pulled Jonas's patch on top of that.  Do
> you want me to merge them together?

Yep, thanks.  And might as well sent them straight to Linus; since
linux-next didn't catch this, there's little point baking them there if
we have some acks.

If he misses it, I'll grab them.

Thanks,
Rusty.
