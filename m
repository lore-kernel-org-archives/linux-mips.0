Received: from mail-bl2on0098.outbound.protection.outlook.com ([65.55.169.98]:10368
        "EHLO na01-bl2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27010711AbaJGQJFNuMAJ (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 7 Oct 2014 18:09:05 +0200
Message-ID: <54341013.2030509@caviumnetworks.com>
Date: Tue, 7 Oct 2014 09:08:51 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
References: <5433071B.4050606@caviumnetworks.com> <20141006213101.GA23797@brightrain.aerifal.cx> <54330D79.80102@caviumnetworks.com> <20141006215813.GB23797@brightrain.aerifal.cx> <543327E7.4020608@amacapital.net> <54332A64.5020605@caviumnetworks.com> <20141007000514.GD23797@brightrain.aerifal.cx> <543334CE.8060305@caviumnetworks.com> <20141007004915.GF23797@brightrain.aerifal.cx> <54337127.40806@gmail.com> <20141007111102.GH23797@brightrain.aerifal.cx>
In-Reply-To: <20141007111102.GH23797@brightrain.aerifal.cx>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rich Felker <dalias@libc.org>
Cc: David Daney <david.s.daney@gmail.com>, Andy Lutomirski <luto@amacapital.net>, David Daney <ddaney.cavm@gmail.com>, libc-alpha@sourceware.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20141007160851.v-yV5YexLhJieEqWM5Ws4Id09lO0cqOZutJLYpJoSg0@z>

On 10/07/2014 04:11 AM, Rich Felker wrote:
> On Mon, Oct 06, 2014 at 09:50:47PM -0700, David Daney wrote:
>>>> the out-of-line execution trick, but do it somewhere other than in
>>>> stack memory.
>>> How do you answer Andy Lutomirski's question about what happens when a
>>> signal handler interrupts execution while the program counter is
>>> pointing at this "out-of-line execution" trampoline? This seems like a
>>> show-stopper for using anything other than the stack.
>> It would be nice to support, but not doing so would not be a
>> regression from current behavior.
>
> It's not just "nice" to support, it's mandatory. Otherwise you will
> execute essentially *random instructions* in this case, providing a
> very nice attack vector that can almost certainly be elevated to
> arbitrary code execution via timing of signals during floating point
> code.
>
> The current behavior in regards to this is correct: because you have a
> *stack*, each trampoline is pushed onto the stack in its own context,
> and popped when it's no longer needed. You can have arbitrarily many
> such trampolines up to the stack size. Note that each nested signal
> handler already requires sizeof(ucontext_t) in stack space, so these
> trampolines are a negligible additional cost without major effects on
> the number of signal handlers you can nest without overflowing the
> stack.

Yes, the stack takes care of the allocations, but the current 
implementation has many problems:

1) Signals clobber the emulation area.
2) Signals caused by the emulation, have incorrect saved machine state.

We have a low bar to pass, any new solution doesn't have to be perfect, 
it only has to be an improvement.

Keep in mind that we are not starting from a clean slate, there are many 
years of legacy code that has built up here.

David Daney
