Message-ID: <005801c12e81$37cc9da0$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <00b701c1275f$0c38a5e0$0deca8c0@Ulysses> <20010821.123113.25481933.nemoto@toshiba-tops.co.jp>
Subject: Re: FP handling in signal.c and traps.c
Date: Mon, 27 Aug 2001 00:48:12 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010826224812.lppR_CYQUAy3KngU4r93P4-GMWVnR-ewIc3UBv4Cpq8@z>

> >>>>> On Fri, 17 Aug 2001 22:56:02 +0200, "Kevin D. Kissell"
<kevink@mips.com> said:
> kevink> I attach a diff relative to the current OSS repository for a
> kevink> proposed patch to fix the signal holes discussed over the past
> kevink> few days.
>
> Thanks for your patch.  I tried this patch and it seems to work fine,
> but I think still there is a hole in it.
>
> After patching it, codes in restore_sigcontext becomes:
>
> if (owned_fp) {
> /* Can't tell if signal handler used FP, must restore */
> err |= restore_fp_context(sc);
> } else {
> if (current == last_task_used_math) {
> /* Signal handler acquired FPU - give it back */
> last_task_used_math = NULL;
> regs->cp0_status &= ~ST0_CU1;
> if (current->used_math) {
> /* Undo possible contamination of thread state */
> restore_thread_fp_context(sc);
> }
> }
> }
>
> But this should be:
>
> if (owned_fp) {
> /* Can't tell if signal handler used FP, must restore */
> err |= restore_fp_context(sc);
> } else {
> if (current == last_task_used_math) {
> /* Signal handler acquired FPU - give it back */
> last_task_used_math = NULL;
> regs->cp0_status &= ~ST0_CU1;
> }
> if (current->used_math) {
> /* Undo possible contamination of thread state */
> restore_thread_fp_context(sc);
> }
> }
>
> This change fix a hole in case that:
>
> - The signaled thread used the FPU but not owns it.
> - and context switch occur in the signal handler.
> - and other thread takes the FPU (the signal handler loses the FPU).
>
> In this case, last_task_used_math is not current at
> restore_sigcontext, but we must restore the saved fp context.

I believe you are correct.  The
"if(current->used_math)restore_thread_fp_context(sc)"
should be moved out one level of conditional.  I had hoped
to avoid some needless thread context restores, but it really
does need to be symmetric with the setup_sigcontext code.

            Kevin K.
