Received: from mail.kernel.org ([198.145.29.99]:49318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992186AbdFVWKz3nata (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 23 Jun 2017 00:10:55 +0200
Date: Thu, 22 Jun 2017 18:10:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] kernel/extable.c: mark core_kernel_text notrace
Message-ID: <20170622181050.220c23a3@gandalf.local.home>
In-Reply-To: <1498028607-6765-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1498028607-6765-1-git-send-email-marcin.nowakowski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-Path: <SRS0=sOnO=53=goodmis.org=rostedt@kernel.org>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Meyer <thomas@m3y3r.de>, Ingo Molnar <mingo@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20170622221050.X5zxwaEoduFoVPu41LSB-MKPflgjZAfnrjspE7Sq0f4@z>

On Wed, 21 Jun 2017 09:03:26 +0200
Marcin Nowakowski <marcin.nowakowski@imgtec.com> wrote:

> core_kernel_text is used by MIPS in its function graph trace processing,
> so having this method traced leads to an infinite set of recursive calls
> such as:
> 
> [    2.972075] Call Trace:
> [    2.972111]
> [    2.976731] [<80506584>] ftrace_return_to_handler+0x50/0x128
> [    2.983379] [<8045478c>] core_kernel_text+0x10/0x1b8
> [    2.989146] [<804119b8>] prepare_ftrace_return+0x6c/0x114
> [    2.995402] [<80411b2c>] ftrace_graph_caller+0x20/0x44
> [    3.001362] [<80411b60>] return_to_handler+0x10/0x30
> [    3.007159] [<80411b50>] return_to_handler+0x0/0x30
> [    3.012827] [<80411b50>] return_to_handler+0x0/0x30
> [    3.018621] [<804e589c>] ftrace_ops_no_ops+0x114/0x1bc
> [    3.024602] [<8045478c>] core_kernel_text+0x10/0x1b8
> [    3.030377] [<8045478c>] core_kernel_text+0x10/0x1b8
> [    3.036140] [<8045478c>] core_kernel_text+0x10/0x1b8
> [    3.041915] [<804e589c>] ftrace_ops_no_ops+0x114/0x1bc
> [    3.047923] [<8045478c>] core_kernel_text+0x10/0x1b8
> [    3.053682] [<804119b8>] prepare_ftrace_return+0x6c/0x114
> [    3.059938] [<80411b2c>] ftrace_graph_caller+0x20/0x44
> (...)
> 
> Mark the function notrace to avoid it being traced.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  kernel/extable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/extable.c b/kernel/extable.c
> index 2676d7f..4efaf26 100644
> --- a/kernel/extable.c
> +++ b/kernel/extable.c
> @@ -70,7 +70,7 @@ static inline int init_kernel_text(unsigned long addr)
>  	return 0;
>  }
>  
> -int core_kernel_text(unsigned long addr)
> +int notrace core_kernel_text(unsigned long addr)

Is mips the only one with this issue. I hate adding notrace to general
functions if it is only an issue with a single arch.

Can we add a: mips_notrace? where we have:

#ifdef CONFIG_MIPS
# define mips_notrace notrace
#else 
# define mips_notrace
#endif

??

-- Steve


>  {
>  	if (addr >= (unsigned long)_stext &&
>  	    addr < (unsigned long)_etext)
