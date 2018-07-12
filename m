Received: from mail-oi0-x242.google.com ([IPv6:2607:f8b0:4003:c06::242]:38605
        "EHLO mail-oi0-x242.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994243AbeGLTxSbg2jf (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 12 Jul 2018 21:53:18 +0200
MIME-Version: 1.0
In-Reply-To: <20180712145849.GB15265@redhat.com>
References: <20180628052209.13056-7-ravi.bangoria@linux.ibm.com>
 <20180701210935.GA14404@redhat.com> <0c543791-f3b7-5a4b-f002-e1c76bb430c0@linux.ibm.com>
 <20180702180156.GA31400@redhat.com> <f19e3801-d56a-4e34-0acc-1040a071cf91@linux.ibm.com>
 <20180703163645.GA23144@redhat.com> <20180703172543.GC23144@redhat.com>
 <f5a39a88-c21e-4606-a04d-11b5f32016b8@linux.ibm.com> <20180710152527.GA3616@redhat.com>
 <6e3ff60b-267a-d49d-4ebb-c4264f9c034b@linux.ibm.com> <20180712145849.GB15265@redhat.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Thu, 12 Jul 2018 12:53:11 -0700
Message-ID: <CAPhsuW6kCtn-tWSj5eKf+kGt8ZEjVwJKLxj9C6zdaqMZByRytg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] Uprobes: Support SDT markers having reference
 count (semaphore)
Content-Type: text/plain; charset="UTF-8"
Return-Path: <liu.song.a23@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, srikar@linux.vnet.ibm.com, rostedt@goodmis.org, mhiramat@kernel.org, Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, acme@kernel.org, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, open list <linux-kernel@vger.kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org, ananth@linux.vnet.ibm.com, alexis.berlemont@gmail.com, naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, linux@armlinux.org.uk, ralf@linux-mips.org, paul.burton@mips.com
Message-ID: <20180712195311.KqM4WH6VHwnEFcWSL61j42niN_vgAsa0vCt9O6Xe0M4@z>

I guess I got to the party late. I found this thread after I started developing
the same feature...

On Thu, Jul 12, 2018 at 7:58 AM, Oleg Nesterov <oleg@redhat.com> wrote:
> On 07/11, Ravi Bangoria wrote:
>>
>> > However, I still think it would be better to avoid uprobe exporting and modifying
>> > set_swbp/set_orig_insn. May be we can simply kill both set_swbp() and set_orig_insn(),
>> > I'll re-check...
>>
>> Good that you bring this up. Actually, we can implement same logic
>> without exporting uprobe. We can do "uprobe = container_of(arch_uprobe)"
>> in uprobe_write_opcode(). No need to export struct uprobe outside,
>> no need to change set_swbp() / set_orig_insn() syntax. Just that we
>> need to pass arch_uprobe object to uprobe_write_opcode().
>
> Yes, but you still need to modify set_swbp/set_orig_insn to pass the new
> arg to uprobe_write_opcode(). OK, this is fine.
>
>
>> But, I wanted to discuss about making ref_ctr_offset a uprobe property
>> or a consumer property, before posting v6:
>>
>> If we make it a consumer property, the design becomes flexible for
>> user. User will have an option to either depend on kernel to handle
>> reference counter or he can create normal uprobe and manipulate
>> reference counter on his own. This will not require any changes to
>> existing tools. With this approach we need to increment / decrement
>> reference counter for each consumer. But, because of the fact that our
>> install_breakpoint() / remove_breakpoint() are not balanced, we have
>> to keep track of which reference counter have been updated in which
>> mm, for which uprobe and for which consumer. I.e. Maintain a list of
>> {uprobe, consumer, mm}.

Is it possible to maintain balanced refcount by modifying callers of
install_breakpoint() and remove_breakpoint()? I am actually working
toward this direction. And I found some imbalance between
     register_for_each_vma(uprobe, uc)
and
     register_for_each_vma(uprobe, NULL)
