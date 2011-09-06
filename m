Received: from mms3.broadcom.com ([216.31.210.19]:1450 "EHLO MMS3.broadcom.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491067Ab1IFGwl (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 6 Sep 2011 08:52:41 +0200
Message-ID: <4E65C326.3010506@broadcom.com>
Date: Mon, 5 Sep 2011 23:52:22 -0700
From: "Bhanu Prakash Gollapudi" <bprakash@broadcom.com>
MIME-Version: 1.0
Subject: Re: [patch net-next-2.6 v3] net: consolidate and fix
 ethtool_ops->get_settings calling
References: <1314905304-16485-1-git-send-email-jpirko@redhat.com>
 <20110902122630.GC1991@minipsycho>
 <1314989161.3419.5.camel@bwh-desktop>
 <20110903133428.GA2821@minipsycho> <1315057614.3092.160.camel@deadeye>
 <5A9BD224CEA58D4CB62235967D650C160A1B7D1C@orsmsx509.amr.corp.intel.com>
In-Reply-To: <5A9BD224CEA58D4CB62235967D650C160A1B7D1C@orsmsx509.amr.corp.intel.com>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: "Zou, Yi" <yi.zou@intel.com>
Cc: Ben Hutchings <bhutchings@solarflare.com>, Jiri Pirko <jpirko@redhat.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "fubar@us.ibm.com" <fubar@us.ibm.com>, "andy@greyhouse.net" <andy@greyhouse.net>, "kaber@trash.net" <kaber@trash.net>, "JBottomley@parallels.com" <JBottomley@parallels.com>, "Love, Robert W" <robert.w.love@intel.com>, "davem@davemloft.net" <davem@davemloft.net>, "shemminger@linux-foundation.org" <shemminger@linux-foundation.org>, "decot@google.com" <decot@google.com>, "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>, "Duyck, Alexander H" <alexander.h.duyck@intel.com>, "amit.salecha@qlogic.com" <amit.salecha@qlogic.com>, "eric.dumazet@gmail.com" <eric.dumazet@gmail.com>, "therbert@google.com" <therbert@google.com>, "paulmck@linux.vnet.ibm.com" <paulmck@linux.vnet.ibm.com>, "laijs@cn.fujitsu.com" <laijs@cn.fujitsu.com>, "xiaosuo@gmail.com" <xiaosuo@gmail.com>, "greearb@candelatech.com" <greearb@candelatech.com>, "loke.chetan@gmail.com" <loke.chetan@gmail.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "devel@open-fcoe.org" <devel@open-fcoe.org>, "bridge@lists.linux-foundation.org" <bridge@lists.linux-foundation.org>
Message-ID: <20110906065222.0ghdN8XnMJimIjL3r0qtES_NU_u3kNRY44qUpl3o4Mo@z>

On 9/5/2011 8:25 PM, Zou, Yi wrote:
>>
>> On Sat, 2011-09-03 at 15:34 +0200, Jiri Pirko wrote:
>>> This patch does several things:
>>> - introduces __ethtool_get_settings which is called from ethtool code
>> and
>>>    from drivers as well. Put ASSERT_RTNL there.
>>> - dev_ethtool_get_settings() is replaced by __ethtool_get_settings()
>>> - changes calling in drivers so rtnl locking is respected. In
>>>    iboe_get_rate was previously ->get_settings() called unlocked. This
>>>    fixes it. Also prb_calc_retire_blk_tmo() in af_packet.c had the same
>>>    problem. Also fixed by calling __dev_get_by_index() instead of
>>>    dev_get_by_index() and holding rtnl_lock for both calls.
>>> - introduces rtnl_lock in bnx2fc_vport_create() and fcoe_vport_create()
>>>    so bnx2fc_if_create() and fcoe_if_create() are called locked as they
>>>    are from other places.
>>> - use __ethtool_get_settings() in bonding code
>>>
>>> Signed-off-by: Jiri Pirko<jpirko@redhat.com>
>> Reviewed-by: Ben Hutchings<bhutchings@solarflare.com>  [except FCoE bits]
>>
>> Ben.
> FCoE bits look ok to me. Thanks,
>
> Reviewed-by: Yi Zou<yi.zou@intel.com>

bnx2fc changes looks OK to me.
Reviewed-by: Bhanu Prakash Gollapudi <bprakash@broadcom.com>
>
>>
>> --
>> Ben Hutchings, Staff Engineer, Solarflare
>> Not speaking for my employer; that's the marketing department's job.
>> They asked us to note that Solarflare product names are trademarked.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
