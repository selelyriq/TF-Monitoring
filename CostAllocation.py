import boto3
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def get_cost_allocation_tag_filter():
    try:
        ce_client = boto3.client('ce')

        tags = [
            {
                'Key': 'Name',
                'Values': ['Frontend', 'Backend', 'Database']
            },
            {
                'Key': 'Environment',
                'Values': ['Production']
            },
            {
                'Key': 'Project',
                'Values': ['ThreeTierApp']
            }
        ]

        response = ce_client.get_cost_allocation_tags(
            CostAllocationTags=tags
        )

        logger.info(f"Found {len(response['CostAllocationTags'])} cost allocation tags")

        return response['CostAllocationTags']

    except Exception as e:
        logger.error(f"Error getting cost allocation tags: {e}")

if __name__ == "__main__":
    tags = get_cost_allocation_tag_filter()
    logger.info(tags)