Received: from mailapp01.imgtec.com ([195.59.15.196]:62047 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009597AbaIWKqWZ5UjQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 23 Sep 2014 12:46:22 +0200
Message-ID: <54214F76.6070808@imgtec.com>
Date: Tue, 23 Sep 2014 11:46:14 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] MIPS: ftrace.h: Fix the MCOUNT_INSN_SIZE definition
References: <1411392779-9554-1-git-send-email-markos.chandras@imgtec.com>       <1411392779-9554-2-git-send-email-markos.chandras@imgtec.com>   <5420546D.6050102@gmail.com> <20140922142534.4087a0a9@gandalf.local.home>
In-Reply-To: <20140922142534.4087a0a9@gandalf.local.home>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Steven Rostedt <rostedt@goodmis.org>, David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Message-ID: <20140923104614.7CK-M1NAZ4HOn4Yu5L8YalrfznD95vLCoMBm5J9wayo@z>

On 09/22/2014 07:25 PM, Steven Rostedt wrote:
> On Mon, 22 Sep 2014 09:55:09 -0700
> David Daney <ddaney.cavm@gmail.com> wrote:
> 
>> On 09/22/2014 06:32 AM, Markos Chandras wrote:
>>> The MCOUNT_INSN_SIZE is meant to be used to denote the overall
>>> size of the mcount() call. Since a jal instruction is used to
>>> call mcount() the delay slot should be taken into consideration
>>> as well.
>>> This also replaces the MCOUNT_INSN_SIZE usage with the real size
>>> of a single MIPS instruction since, as described above, the
>>> MCOUNT_INSN_SIZE is used to denote the total overhead of the
>>> mcount() call.
>>
>> Are you seeing errors with the existing code?  If so please state what 
>> they are.
>>
>> By changing this, we can no longer atomically replace the instruction. 
>> So I think shouldn't be changing this stuff unless there is a real bug 
>> we are fixing.
> 
> Actually, it looks like the code still works the same, as it uses the
> old size of 4 (FTRACE_MIPS_INSN_SIZE) to do the update.

Indeed I haven't seen any functional change when it comes to replacing
the instruction.

> [...]
> 
> It may also fix the stack tracer, as it searches for the ip saved in
> the return address to find where the true stack is (skipping the stack
> part that calls the strack tracer itself). If the link register holds
> the location after the delay slot, then this would require
> MCOUNT_INSN_SIZE to include the delay slot as well.

Yes, this is the only case I spotted as well. Perhaps I should put that
in the changelog.

Or I could add
> another macro called MCOUNT_DELAY_SLOT_SIZE that can be defined by an
> arch (and keep it zero for all other archs). That wouldn't be too much
> of an issue to implement.

If you want to fix that in the generic code then I am fine with it.

-- 
markos
