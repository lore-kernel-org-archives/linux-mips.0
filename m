Received: from multi.imgtec.com ([194.200.65.239]:34579 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6815757Ab3FXJKQ0fy55 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 24 Jun 2013 11:10:16 +0200
Message-ID: <51C80CF0.4070608@imgtec.com>
Date: Mon, 24 Jun 2013 10:10:08 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] kernel/signal.c: fix BUG_ON with SIG128 (MIPS)
References: <1371821962-9151-1-git-send-email-james.hogan@imgtec.com> <51C47864.9030200@gmail.com> <20130621202244.GA16610@redhat.com> <51C4BB86.1020004@caviumnetworks.com> <20130622190940.GA14150@redhat.com>
In-Reply-To: <20130622190940.GA14150@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <James.Hogan@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Oleg Nesterov <oleg@redhat.com>, David Daney <ddaney@caviumnetworks.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, David Daney <david.daney@cavium.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Dave Jones <davej@redhat.com>, linux-mips@linux-mips.org
Message-ID: <20130624091008.-IGFSkUD0MPSFLtRpIMvRAVHxWy81-p7eYbI3dYsfT4@z>

On 22/06/13 20:09, Oleg Nesterov wrote:
> On 06/21, David Daney wrote:
>> I am proposing that we just reduce the number of usable signals such
>> that existing libc status checking macros/functions don't change in any
>> way.
> 
> And I fully agree! Absolutely, sorry for confusion.
> 
> 
> What I tried to say, _if_ we change the ABI instead, lets make this
> change sane.

I agree that this approach isn't very nice (I was really just trying to
explore the options) and reducing the number of signals is nicer. But is
anybody here confident enough that the number of signals changing under
the feet of existing binaries/libc won't actually break anything real?
I.e. anything trying to use SIGRTMAX() to get a lower priority signal.

> 
> To me this hack is not sane. And btw, the patch doesn't look complete.
> Say, wait_task_zombie() should do exitcode_to_sig() for ->si_status.

Ah yes, I didn't seen that.

Cheers
James
