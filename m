Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.232]:28125 "EHLO
        cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S27014220AbaKUVb3Ka1kk (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 21 Nov 2014 22:31:29 +0100
Date: Fri, 21 Nov 2014 16:31:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: ftrace function graph with static ftrace does not work on MIPS
Message-ID: <20141121163116.523cb394@gandalf.local.home>
In-Reply-To: <546F06F8.4070500@imgtec.com>
References: <546478A1.5040306@imgtec.com>
        <20141120110942.0bbc70a1@gandalf.local.home>
        <546F06F8.4070500@imgtec.com>
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
Message-ID: <20141121213116.WAL6IRp_tAk3pB9F8M9b_KqvkrLhF_4RH6yuybRODpY@z>

On Fri, 21 Nov 2014 09:33:44 +0000
Markos Chandras <Markos.Chandras@imgtec.com> wrote:
 
> Hi Steven,
> 
> I had a look on
> 
> https://www.kernel.org/doc/Documentation/trace/ftrace-design.txt
> 
> and section "HAVE_FUNCTION_GRAPH_TRACER"
> 
> According to the sample code, first we check "ftrace_trace_function !=
> ftrace_stub" and if that's true, then we never check the ftrace_graph_*
> functions which is exactly what MIPS does. So the graph functions are
> not always checked. x86 seems to do something similar in mcount_64.S
> 

Thanks, I need to update that file.

I don't test static tracing much as I feel it's overhead makes it
almost not worth keeping. I've been even thinking of nuking it, but I
keep it in because it's good for archs adding function tracing to get a
basic test working, as dynamic function tracing is a bit more difficult
to implement.

But yeah, don't go too much by that document. It is out of date, and
when I get time, I'll have to update it. I'll probably do that when I
bring powerpc up to speed with x86 (except for the fentry part).

I want dynamic trampolines for powerpc and such, and when I do that, it
will make all the changes fresh in my mind to go back and tackle the
design documentation.

-- Steve
