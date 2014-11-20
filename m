Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.231]:14221 "EHLO
        cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27014080AbaKTQJ6Pdnuw (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 20 Nov 2014 17:09:58 +0100
Date: Thu, 20 Nov 2014 11:09:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: ftrace function graph with static ftrace does not work on MIPS
Message-ID: <20141120110942.0bbc70a1@gandalf.local.home>
In-Reply-To: <546478A1.5040306@imgtec.com>
References: <546478A1.5040306@imgtec.com>
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
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, mingo@redhat.com
Message-ID: <20141120160942.47XBdefWSOXrrrv5OjAt8f59EMycfH3FhUMTty1YLpI@z>

On Thu, 13 Nov 2014 09:23:45 +0000
Markos Chandras <Markos.Chandras@imgtec.com> wrote:

> Hi,
> 
> I am trying to understand why ftrace function graph doesn't work when
> using static ftrace on MIPS. So, what happens when I do 'echo
> function_graph > current_tracer' is that the ftrace_graph_caller from
> mcount.S is executed once. The function that called it is
> 'core_kernel_data()' from __register_ftrace_function in
> kernel/trace/ftrace.c
> 
> However, this is the only function that is reported in the trace file
> 
> # cat trace
> # tracer: function_graph
> #
> # CPU  DURATION                  FUNCTION CALLS
> # |     |   |                     |   |   |   |
>  0)               |  core_kernel_data() {
>  0)   0.000 us    |  } /* core_kernel_data */
> 
> The reason that the ftrace_graph_caller is never executed after that is
> that the following as far as I understand:
> 
> NESTED(_mcount, PT_SIZE, ra)
>         PTR_LA  t1, ftrace_stub
>         PTR_L   t2, ftrace_trace_function /* Prepare t2 for (1) */
>         bne     t1, t2, static_trace
>          nop
> 
> #ifdef  CONFIG_FUNCTION_GRAPH_TRACER
>         PTR_L   t3, ftrace_graph_return
>         bne     t1, t3, ftrace_graph_caller
>          nop
>         PTR_LA  t1, ftrace_graph_entry_stub
>         PTR_L   t3, ftrace_graph_entry
>         bne     t1, t3, ftrace_graph_caller
>          nop
> #endif
> 
> The previous 3 conditionals exists in arch/mips/kernel/mcount.S.
> Originally, ftrace_trace_function == ftrace_stub, so the first
> conditional is not taken and we end up executed the ftrace_graph_caller.
> All good.
> However, later on, ftrace_trace_function is set to 'ftrace_ops_no_ops',
> so the first 'bne' is taken and the ftrace_graph_caller is never
> executed after that. It is not clear to me if this behaviour is expected
> so I used QEMU to get a backtrace when ftrace_trace_function is set to
> ftrace_ops_no_ops.

Looks like the static tracing code in wrong. The function graph code
should be tested every time.

-- Steve
