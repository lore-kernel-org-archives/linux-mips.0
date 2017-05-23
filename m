Received: from smtprelay0103.hostedemail.com ([216.40.44.103]:37361 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23994768AbdEWTcszl-mC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 May 2017 21:32:48 +0200
Date: Tue, 23 May 2017 15:32:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] MIPS: ftrace: fix init functions tracing
Message-ID: <20170523153240.72a8ecd5@vmware.local.home>
In-Reply-To: <1495537003-1013-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1495537003-1013-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <rostedt@goodmis.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Cc: Ingo Molnar <mingo@redhat.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20170523193240.x2eW_3gQaKvKxRYv5Iu54jSwzs34oOJuO8UJ7qbFb3o@z>

On Tue, 23 May 2017 12:56:43 +0200
Marcin Nowakowski <marcin.nowakowski@imgtec.com> wrote:

> Since introduction of tracing for init functions the in_kernel_space()
> check is no longer correct, as it ignores the init sections. As a
> result, when probes are inserted (and disabled) in the init functions,
> a branch instruction is inserted instead of a nop, which is likely to
> result in random crashes during boot.
> 
> Remove the MIPS-specific in_kernel_space() method and replace it with
> a generic core_kernel_text() that also checks for init sections during
> system boot stage.
> 
> Fixes: 42c269c88dc1 ("ftrace: Allow for function tracing to record
> init functions on boot up") Signed-off-by: Marcin Nowakowski
> <marcin.nowakowski@imgtec.com> ---
>  arch/mips/kernel/ftrace.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
>

Thanks for doing this.

-- Steve
