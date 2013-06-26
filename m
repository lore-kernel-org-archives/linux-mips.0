Received: from multi.imgtec.com ([194.200.65.239]:37892 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6816900Ab3FZLI7hxAKU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 26 Jun 2013 13:08:59 +0200
Message-ID: <51CACB80.5020706@imgtec.com>
Date: Wed, 26 Jun 2013 12:07:44 +0100
From: James Hogan <james.hogan@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH v3] kernel/signal.c: fix BUG_ON with SIG128 (MIPS)
References: <1371821962-9151-1-git-send-email-james.hogan@imgtec.com> <51C47864.9030200@gmail.com> <20130621202244.GA16610@redhat.com> <51C4BB86.1020004@caviumnetworks.com> <20130622190940.GA14150@redhat.com> <51C80CF0.4070608@imgtec.com> <20130625144015.1e4e70a0ac888f4ccf5c6a8f@linux-foundation.org> <CAAG0J9-5J6=c=1VxEW6FevMHKsjShtbjM8G6Q1vu1P+LurQqoQ@mail.gmail.com>
In-Reply-To: <CAAG0J9-5J6=c=1VxEW6FevMHKsjShtbjM8G6Q1vu1P+LurQqoQ@mail.gmail.com>
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
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>, David Daney <ddaney@caviumnetworks.com>, David Daney <ddaney.cavm@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>, David Daney <david.daney@cavium.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Dave Jones <davej@redhat.com>, linux-mips@linux-mips.org, stable@vger.kernel.org
Message-ID: <20130626110744.q5eK40izMzJoc03ME5d5XXHRN7ZhDv3TWBC-0umPdfQ@z>

On 25/06/13 23:13, James Hogan wrote:
> On 25 June 2013 22:40, Andrew Morton <akpm@linux-foundation.org> wrote:
>> Meanwhile, unprivileged users can make a MIPS kernel go BUG.
>>
>> How much of a problem is this?  Obviously less of a problem with MIPS
>> than it would be with some other CPU types, but I'd imagine it's still
>> awkward in some environments.
>>
>> If this _is_ considered a problem, can we think of some nasty little
>> hack which at least makes the effects less damaging, which we can also
>> put into -stable kernels?
> 
> The first rfc patch I sent sort of satisfies that by passing 127 if
> sig==128, or slightly better would be passing 126 if sig>=127 (so that
> SIFSIGNALED returns true). Effectively #ifdef'ing it on _NSIG>127 as
> this patch does may be preferable too.
> 
> That's probably the minimum change necessary to evade the BUG_ON
> without removing it. The wait status code will still be wrong, but it
> wasn't exactly right before so it's no worse.
> 
> IMO changing the ABI by reducing _NSIG to 127 or 126 isn't appropriate
> for stable.

How does this look for a nasty/stable fix?
