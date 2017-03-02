Received: from mail-sn1nam02on0070.outbound.protection.outlook.com ([104.47.36.70]:28112
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993875AbdCBTYfuBkmR (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 2 Mar 2017 20:24:35 +0100
Subject: Re: [PATCH] module: set __jump_table alignment to 8
References: <20170301220453.4756-1-david.daney@cavium.com>
 <20170302131119.6f52203f@gandalf.local.home>
 <20170302182625.GB13268@packer-debian-8-amd64.digitalocean.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <f38431ab-ad33-ac14-03b5-7cb4a172be64@caviumnetworks.com>
Date: Thu, 2 Mar 2017 11:24:23 -0800
MIME-Version: 1.0
In-Reply-To: <20170302182625.GB13268@packer-debian-8-amd64.digitalocean.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jessica Yu <jeyu@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, David Daney <david.daney@cavium.com>, Jason Baron <jbaron@akamai.com>, Michael Ellerman <mpe@ellerman.id.au>, Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Chris Metcalf <cmetcalf@mellanox.com>, Ralf Baechle <ralf@linux-mips.org>, Russell King <linux@armlinux.org.uk>, Rabin Vincent <rabin@rab.in>, Paul Mackerras <paulus@samba.org>, Anton Blanchard <anton@samba.org>, Ingo Molnar <mingo@kernel.org>, Zhigang Lu <zlu@ezchip.com>

On 03/02/2017 10:26 AM, Jessica Yu wrote:
> +++ Steven Rostedt [02/03/17 13:11 -0500]:
>>
>> Can I get an Ack from a module maintainer?
>
> Acked-by: Jessica Yu <jeyu@redhat.com>
>
> Thanks!
>
> Jessica

Thanks Jessica,

Can you also add scripts/module-common.lds to MAINTAINERS so that 
get_maintainers.pl will indicate that Jessica Yu and Rusty Russell be 
CCed on things like this in the future?


>
>> On Wed,  1 Mar 2017 14:04:53 -0800
>> David Daney <david.daney@cavium.com> wrote:
>>
>>> For powerpc the __jump_table section in modules is not aligned, this
>>> causes a WARN_ON() splat when loading a module containing a
>>> __jump_table.
>>>
>>> Strict alignment became necessary with commit 3821fd35b58d
>>> ("jump_label: Reduce the size of struct static_key"), currently in
>>> linux-next, which uses the two least significant bits of pointers to
>>> __jump_table elements.
>>>
>>> Fix by forcing __jump_table to 8, which is the same alignment used for
>>> this section in the kernel proper.
>>>
>>> Signed-off-by: David Daney <david.daney@cavium.com>
>>> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>>> ---
>>>  scripts/module-common.lds | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/scripts/module-common.lds b/scripts/module-common.lds
>>> index 73a2c7d..53234e8 100644
>>> --- a/scripts/module-common.lds
>>> +++ b/scripts/module-common.lds
>>> @@ -19,4 +19,6 @@ SECTIONS {
>>>
>>>      . = ALIGN(8);
>>>      .init_array        0 : { *(SORT(.init_array.*)) *(.init_array) }
>>> +
>>> +    __jump_table        0 : ALIGN(8) { KEEP(*(__jump_table)) }
>>>  }
>>
