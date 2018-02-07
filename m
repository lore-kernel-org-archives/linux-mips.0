Received: from userp2120.oracle.com ([156.151.31.85]:52984 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23990434AbeBGRCg6aE-V (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 7 Feb 2018 18:02:36 +0100
Subject: Re: [net-next,06/15] i40e: change flags to use 64 bits
References: <20180126212459.4246-7-jeffrey.t.kirsher@intel.com>
 <20180207150907.GB5092@saruman>
From: Shannon Nelson <shannon.nelson@oracle.com>
Message-ID: <e7c934d7-e5f4-ee1b-0647-c31a98d9e944@oracle.com>
Date: Wed, 7 Feb 2018 09:02:17 -0800
MIME-Version: 1.0
In-Reply-To: <20180207150907.GB5092@saruman>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Return-Path: <shannon.nelson@oracle.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <jhogan@kernel.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: davem@davemloft.net, Alice Michael <alice.michael@intel.com>, netdev@vger.kernel.org, nhorman@redhat.com, sassmann@redhat.com, jogreene@redhat.com, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

On 2/7/2018 7:09 AM, James Hogan wrote:
> On Fri, Jan 26, 2018 at 01:24:50PM -0800, Jeff Kirsher wrote:
>> From: Alice Michael <alice.michael@intel.com>
>>
>> As we have added more flags, we need to now use more
>> bits and have over flooded the 32 bit size.  So
>> make it 64.
>>
>> Also change all the existing bits to unsigned long long
>> bits.
>>
>> Signed-off-by: Alice Michael <alice.michael@intel.com>
>> Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
>> Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
>> ---
>>   drivers/net/ethernet/intel/i40e/i40e.h         | 67 +++++++++++++-------------
>>   drivers/net/ethernet/intel/i40e/i40e_ethtool.c |  4 +-
>>   2 files changed, 36 insertions(+), 35 deletions(-)
> 
> ...
> 
>> @@ -4323,7 +4323,7 @@ static int i40e_set_priv_flags(struct net_device *dev, u32 flags)
>>   	 * originally. We'll just punt with an error and log something in the
>>   	 * message buffer.
>>   	 */
>> -	if (cmpxchg(&pf->flags, orig_flags, new_flags) != orig_flags) {
>> +	if (cmpxchg64(&pf->flags, orig_flags, new_flags) != orig_flags) {
> 
> This breaks allyesconfig builds on certain architectures, for example
> MIPS 32-bit with SMP enabled, which doesn't support cmpxchg64:
> 
>    CC      drivers/net/ethernet/intel/i40e/i40e_ethtool.o
> drivers/net/ethernet/intel/i40e/i40e_ethtool.c: In function ‘i40e_set_priv_flags’:
> drivers/net/ethernet/intel/i40e/i40e_ethtool.c:4326:6: error: implicit declaration of function ‘cmpxchg64’; did you mean ‘__cmpxchg’? [-Werror=implicit-function-declaration]
>    if (cmpxchg64(&pf->flags, orig_flags, new_flags) != orig_flags) {
>        ^~~~~~~~~
>        __cmpxchg
> 
> Should the driver now depend on 64BIT or something?

A long time ago this was the original expectation for this driver, but 
it was strongly suggested that in order to play well in the kernel it 
needed to be usable in 32-bit builds as well.  I suspect this sentiment 
remains, and besides we don't want to break existing support, so this 
probably needs to be addressed for 32-bit.

sln

> 
> Cheers
> James
> 
