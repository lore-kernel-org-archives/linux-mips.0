Received: from mail1.windriver.com ([147.11.146.13]:57256 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990514AbdCFH7chTF0d (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 6 Mar 2017 08:59:32 +0100
Subject: Re: [PATCH] MIPS: reset all task's asid to 0 after asid_cache(cpu)
 overflows
References: <80B78A8B8FEE6145A87579E8435D78C307943B56@FZEX3.ruijie.com.cn>
From: jsun4 <Jiwei.Sun@windriver.com>
Message-ID: <58BD170A.3080302@windriver.com>
Date: Mon, 6 Mar 2017 16:00:10 +0800
MIME-Version: 1.0
In-Reply-To: <80B78A8B8FEE6145A87579E8435D78C307943B56@FZEX3.ruijie.com.cn>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
Return-Path: <Jiwei.Sun@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: yhb@ruijie.com.cn
Cc: linux-mips@linux-mips.org
Message-ID: <20170306080010.xReRyq1hSWGCvoUxjO6tbFl1JaAAYyRsuFdkz7DI4cU@z>

Hello yhb,

Thanks for your reply and review.

On 03/06/2017 10:44 AM, yhb@ruijie.com.cn wrote:
> +		if (!asid) {		/* fix version if needed */
> +			struct task_struct *p;
> +
> +			for_each_process(p) {
> +				if ((p->mm))
> +					cpu_context(cpu, p->mm) = 0;
> +			}
>   It is not safe. When the processor is executing these codes, another processor is freeing task_struct, setting p->mm to NULL, and freeing mm_struct.

Yes, I overlooked this point. There are else code in order to resolve this question,

diff --git a/arch/mips/include/asm/mmu_context.h b/arch/mips/include/asm/mmu_context.h
index 2abf94f..b1c0911 100644
--- a/arch/mips/include/asm/mmu_context.h
+++ b/arch/mips/include/asm/mmu_context.h
@@ -105,8 +105,20 @@ static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
		if (cpu_has_vtag_icache)
			flush_icache_all();
		local_flush_tlb_all(); /* start new asid cycle */
-	 	if (!asid) /* fix version if needed */
+		if (!asid) { /* fix version if needed */
+	 		struct task_struct *p;
+
+		 	read_lock(&tasklist_lock);
+ 			for_each_process(p) {
+ 				task_lock(p);
+ 				if (p->mm)
+ 					cpu_context(cpu, p->mm) = 0;
+ 				task_unlock(p);
+ 			}
+	 		read_unlock(&tasklist_lock);
+
+			asid = asid_first_version(cpu);
+ 		}
	}

Because before another processor frees mm_struct, it will get the lock p->alloc_lock.
543 /* more a memory barrier than a real lock */
544 task_lock(current);
545 current->mm = NULL;
546 up_read(&mm->mmap_sem);
547 enter_lazy_tlb(mm, current);
548 task_unlock(current);

>   I committed a patch to solve this problem.Please see https://patchwork.linux-mips.org/patch/13789/.
> 
I saw the patch that you list in the link.
Why did you add a list and a lot of else codes(else arch and mm/, kernel/) to resolve this
risk that is difficult to hit? I don't think this is a good idea.
And in clear_other_mmu_contexts()
+	static inline void clear_other_mmu_contexts(struct mm_struct *mm,
+ 	unsigned long cpu)
+	{
+ 		unsigned long flags;
+ 		struct mm_struct *p;
+
+ 		spin_lock_irqsave(&mmlink_lock, flags);
+ 		list_for_each_entry(p, &mmlist, mmlink) {
+ 			if ((p != mm) && cpu_context(cpu, p))

"(p != mm)" is not essential, because cpu_context(cpu, mm) will be changed to asid_first_version(cpu) in
get_new_mmu_context(struct mm_struct *mm, unsigned long cpu), and it is inefficient.
And "cpu_context(cpu, p)" is not essential too, I think. 

+ 				cpu_context(cpu, p) = 0;
+ 		}
+ 		spin_unlock_irqrestore(&mmlink_lock, flags);
+	}
+

Thanks,
Best regards,
Jiwei
