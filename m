Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BD31A6823;
	Mon, 17 Aug 2026 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932501; cv=none; b=cLvSJtIsweNmjl3veXs9sxbCXuc7Y0cG2gUfxpJ7MAQIR4mEszmvB3glzMO/sovV3XQtZKq68AjdEGUlqMw5ZN1A4IEY+bt506iKc5uO/o8MbbmGAqjMT2vjQ3pOPSLs6TTssomX3lwhFOrU6RkR/G3ynCJ/QVbkUugfEwTGdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932501; c=relaxed/simple;
	bh=cUHXnEFb0DPT0cP8sQAYf526pNBm/FM6F6+YWEZkqWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfF8D31rQI0g7Wji1SP84CXoeaG0sEm3egdFZBjZIxaHtrI5CWBAfU9ypSGa/xyaPGi0LrS8Mu14MHqTJnlcl6cI+tzgbNZ6bAxccFwLTFJPXYPfY6hzdhHX2O4mSQTfB8ao4qBdjaEYvoDc15pPebVoysZfyj5zNR4a1kVd+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.87])
	by gateway (Coremail) with SMTP id _____8CxQNEDbYJqnbYBAA--.5127S3;
	Mon, 17 Aug 2026 10:08:04 +0800 (CST)
Received: from [10.161.0.102] (unknown [223.64.68.87])
	by front1 (Coremail) with SMTP id qMiowJAx2c3_bIJqU28HAA--.48469S2;
	Mon, 17 Aug 2026 10:08:02 +0800 (CST)
Message-ID: <735044e7-07e8-462e-b94f-4fea1b5b1838@loongson.cn>
Date: Mon, 17 Aug 2026 10:07:59 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
To: Frank Li <Frank.li@oss.nxp.com>,
 Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, linux-mips@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720142538.2766-1-mahad.ibrahim.dev@gmail.com>
 <20260729143247.6111-1-mahad.ibrahim.dev@gmail.com>
 <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <an9teadkgwUsmMnQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAx2c3_bIJqU28HAA--.48469S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgECCGqBKnQHswAAsI
X-Coremail-Antispam: 1Uk129KBj93XoWxGrW5XrWkZw1DGr1UWw48AFc_yoWrGrWkpF
	WfG3ZFka1kJF4av3ZFgw1FyFs0yFZ7Gry7urZIgw1xuryqyryqvw17Ga4rWF9rAa93X3WS
	qay0ga43CF4UAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Kb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	kF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWU
	JVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcTKZDUUUU

Hi Frank:

Sorry for the late reply.

On 2026/8/15 03:33, Frank Li wrote:
> On Wed, Jul 29, 2026 at 02:32:47PM +0000, Mahad Ibrahim wrote:
>> ls1x_dma_tx_status() locates the descriptor actively being processed by
>> walking the LLI list and comparing the hardware reported next descriptor
>> pointer against each element's next-descriptor pointer.
>>
>> A list_for_each_entry macro is used in the comparison phase. Which at
>> the end of the loop leaves the lli pointer at the currently executing LLI.
>> However this also subsequently runs for a non-match lli, in which it
>> points at the head. This causes a type confusion bug which treats the
>> head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
>> goes forwards and prints garbage via the dev_dbg.
>>
>> Fix the type confusion bug by only allowing matched LLI descriptor chains
>> to print the current LLI and residue calculation, as failing to match
>> should be treated as an unexpected condition.
>>
>> Found by the following Coccinelle check:
>>
>>    scripts/coccinelle/iterators/use_after_iter.cocci
>>
>>    drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
>>    reference to the index variable of the iterator on line 450
>>
>> I did not see a bug upstream detailing this error, nor do I have the
>> hardware to confirm this bug or error, all this is from a pure code
>> examination.
>>
>> As I do not possess the hardware, I cannot test the patch. Compile tested
>> only with mips64-linux-gnu-gcc.
> 
> Avoid post new patch on old email thread.
> 
> Just simple said
> 
> Compile test only.
> 
>>
>> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
>> ---
>>
>> v2:
>> - encapsulate residue calculation and dev_dbg inside the
>>    list_for_each_entry() macro. Treat non-matching LLI as an unexpected
>>    case.
>>
>>
>>   drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
>> index 89786cbd20ab..8658d5377795 100644
>> --- a/drivers/dma/loongson/loongson1-apb-dma.c
>> +++ b/drivers/dma/loongson/loongson1-apb-dma.c
>> @@ -446,22 +446,27 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
>>
>>   			/* locate the current lli */
>>   			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
>> -			list_for_each_entry(lli, &desc->lli_list, node)
>> -				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
>> -					break;
>> +			list_for_each_entry(lli, &desc->lli_list, node) {
>> +				if (lli->hw[LS1X_DMADESC_NEXT] != next_phys)
>> +					continue;
>>
>> -			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
>> -				&lli->phys);
>> +				dev_dbg(chan2dev(dchan), "current lli_phys=%pad\n",
>> +					&lli->phys);
>>
>> -			/* count the residues */
>> -			list_for_each_entry_from(lli, &desc->lli_list, node)
>> -				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
>> -					 chan->bus_width;
>> +				/* count the residues */
>> +				list_for_each_entry_from(lli, &desc->lli_list, node)
>> +					bytes += lli->hw[LS1X_DMADESC_LENGTH] *
>> +						 chan->bus_width;
>> +
>> +				dma_set_residue(state, bytes);
>> +				return status;
>> +			}
>> +
>> +			dev_warn(chan2dev(dchan),
>> +				 "unable to locate current lli.\n");
> 
> most likely logic is correct, it is not obvious, hope some one who have
> hardware help test it.
> 
> Binbin Zhou just add add this driver recently, he should have hardware to
> test it.

Emm, sorry, I don't have any test equipment available right now. As far 
as I know, Keguang is the maintainer of this driver, and he has the 
necessary test equipment.
> 
> Frank
>>   		}
>>   	}
>>
>> -	dma_set_residue(state, bytes);
>> -
>>   	return status;
>>   }
>>
>> --
>> 2.54.0
>>

-- 
Thanks.
Binbin

