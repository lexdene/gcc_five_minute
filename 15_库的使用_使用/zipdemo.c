#include <zip.h>

void usage(){
	printf("zipdemo filename\n");
}

int main(int argc, char *argv[]){
	int errorp = 0;
	struct zip* zipObj = NULL;
	int num_entries = 0;
	int i;

	if( argc < 2){
		usage();
		return 1;
	}

	zipObj = zip_open(argv[1],0,&errorp);
	if( NULL == zipObj ){
		printf("open zip file failed , error code : %d\n",errorp);
		return 2;
	}

	num_entries = zip_get_num_files(zipObj) ;
	for( i = 0 ; i < num_entries ; ++i ){
		printf("%s\n",zip_get_name(zipObj,i,0) );
	}

	zip_close(zipObj);
	zipObj = NULL ;

	return 0;
};
