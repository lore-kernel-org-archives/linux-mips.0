Received: from mail-bn1bn0109.outbound.protection.outlook.com ([157.56.110.109]:61668
        "EHLO na01-bn1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6822286AbaELLVfWxvX4 (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 12 May 2014 13:21:35 +0200
Date: Mon, 12 May 2014 13:21:11 +0200
From: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
Subject: Re: [PATCH 11/11] kvm tools: Modify term_putc to write more than one
 char
Message-ID: <20140512112111.GE15623@alberich>
References: <1399391491-5021-1-git-send-email-andreas.herrmann@caviumnetworks.com>
 <1399391491-5021-12-git-send-email-andreas.herrmann@caviumnetworks.com>
 <536A5826.6010008@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <536A5826.6010008@cogentembedded.com>
Return-Path: <Andreas.Herrmann@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Pekka Enberg <penberg@kernel.org>, David Daney <ddaney.cavm@gmail.com>, kvm@vger.kernel.org, linux-mips@linux-mips.org, David Daney <david.daney@cavium.com>
Message-ID: <20140512112111.JuY8NpgzKtUJXj78D7JIQAMeIbWNs8VJ9lzVcBocKu8@z>

On Wed, May 07, 2014 at 07:58:30PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 06-05-2014 19:51, Andreas Herrmann wrote:
> 
> >From: David Daney <david.daney@cavium.com>
> 
> >It is a performance enhancement. When running in a simulator, each
> >system call to write a character takes a lot of time.  Batching them
> >up decreases the overhead (in the root kernel) of each virtio console
> >write.
> 
> >Signed-off-by: David Daney <david.daney@cavium.com>
> >Signed-off-by: Andreas Herrmann <andreas.herrmann@caviumnetworks.com>
> >---
> >  tools/kvm/term.c |    7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> >diff --git a/tools/kvm/term.c b/tools/kvm/term.c
> >index 3de410b..b153eed 100644
> >--- a/tools/kvm/term.c
> >+++ b/tools/kvm/term.c
> >@@ -52,11 +52,14 @@ int term_getc(struct kvm *kvm, int term)
> >  int term_putc(char *addr, int cnt, int term)
> >  {
> >  	int ret;
> >+	int num_remaining = cnt;
> >
> >-	while (cnt--) {
> >-		ret = write(term_fds[term][TERM_FD_OUT], addr++, 1);
> >+	while (num_remaining) {
> >+		ret = write(term_fds[term][TERM_FD_OUT], addr, num_remaining);
> >  		if (ret < 0)
> >  			return 0;
> 
>    Perhaps 'return cnt - num_remaining' instead?

Although all current callers of this function are not checking the
return value I aggree that this change would be nice to have.

I wouldn't make this change within this patch though.
(I'll add a separate patch to modify the return value.)

> >+		num_remaining -= ret;
> >+		addr += ret;
> >  	}
> >
> >  	return cnt;
> 
> WBR, Sergei


Thanks,
Andreas
